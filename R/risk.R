#' Calculate Log Normal Parameters
#'
#' Calculate the parameters of a log normal distribution from quantile estimates.
#'
#' If `p05` is not provided (the default), use `p50` (median) and `p95` to calculate `meanlog` and
#'   `sdlog`. If `p05` is provided, use `p05` and `p95` to calculate the parameters, and also
#'   calculate the fractional difference between the estimated median value (0.5 quantile) and the
#'   median value calculated from the 0.05 and 0.95 values.
#'
#' `mdiff` is set to `NA` if `p05` is not provided.
#'
#' @param p50 the most likely value, the 0.5 quantile.
#' @param p95 the "high" value, the 0.95 quantile.
#' @param p05 the "low" value, the 0.05 quantile.
#'
#' @return a list including the `meanlog` and `sdlog` parameters, as well as the fractional
#'         difference between the estimated and actual median (0.5 quantile), `mdiff`.
#'
#' @examples
#' lnorm_param(p50 = 1425000, p95 = 20000000)
#' lnorm_param(p50 = 1425000, p95 = 20000000, p05 = 100000)
#'
#' @export
lnorm_param <- function(p50, p95, p05 = NA) {
  checkmate::assert_numeric(p50, lower = 0, finite = TRUE, any.missing = FALSE)
  checkmate::assert_numeric(p95, lower = 0, finite = TRUE, any.missing = FALSE)
  checkmate::assert_numeric(p05, lower = 0, finite = TRUE)

  if (anyNA(p05)) {
    meanlog <- log(p50)
    sdlog <- (log(p95) - log(p50)) / stats::qnorm(0.95)
    mdiff <- NA
  } else {
    meanlog <- ((log(p95) - log(p05)) / 2) + log(p05)
    sdlog <- (log(p95) - log(p05)) / (2 * stats::qnorm(0.95))
    lnorm_median <- stats::qlnorm(0.5, meanlog = meanlog, sdlog = sdlog)
    mdiff <- (p50 - lnorm_median) / lnorm_median
  }

  list(meanlog = meanlog, sdlog = sdlog, mdiff = mdiff)
}

#' Calculate Risk
#'
#' Calculate risk using a Poisson log-normal model. The number of events per time period is
#'   calculated using `rpois(runs, lambda)` and total loss for each time period using
#'   `sum(rlnorm(events, meanlog, sdlog))`.
#'
#' @param risk Risk name (a string)
#' @param lambda Parameter passed to `rpois()`
#' @param meanlog Parameter passed to `rlnorm()`
#' @param sdlog Parameter passed to `rlnorm()`
#' @param treatment Risk treatment (a string)
#' @param runs Number of simulations
#'
#' @return A tibble of `runs` rows containing the number of events (`events`), and the total value
#'         of losses (`losses`) for each run.
#'
#' @export
# default runs reduced from 1e5 to 25000 to fix code-link and improve performance
calc_risk <- function(risk, lambda, meanlog, sdlog, treatment = "none", runs = 25000) {
  events <- stats::rpois(runs, lambda)
  losses <- purrr::map_dbl(events, \(n) sum(stats::rlnorm(n, meanlog, sdlog)))

  tibble::as_tibble(list(events = events, losses = losses)) |>
    dplyr::mutate(year = dplyr::row_number(), risk = risk, treatment = treatment, .before = events)
}

#' Geometric Mean
#'
#' Function for the geometric mean.
#'
#' Returns `NaN` if `x` includes negative values.
#'
#' @inheritParams base::mean
#' @param x a numeric or complex vector.
#' @param zero.rm a logical evaluating to `TRUE` or `FALSE` indicating whether `0` values should be
#'   stripped before the computation proceeds.
#'
#' @return Geometric mean, `exp(mean(log(x))`. `NA` values are removed if `na.rm` is `TRUE`.
#' @export
gmean <- function(x, zero.rm = TRUE, na.rm = TRUE) { # nolint: object_name_linter. mean() uses na.rm
  if (zero.rm) {
    x <- x[x != 0]
  }
  if (any(x < 0)) {
    warning("NaNs produced", call. = FALSE)
    return(NaN)
  }
  exp(mean(log(x), na.rm = na.rm))
}
