#' Check validation results
#'
#' Check results from [validate::confront()] and raise warnings if any validations had failures, or
#'   if any validations resulted in an error or a warning.
#'
#' @param out output from [validate::confront()].
#'
#' @return `FALSE` if the validation had any failures or resulted in any errors or warnings,
#'  otherwise `TRUE`, invisibly.
#' @export
check_validation <- function(out) {
  warn_base <- "one or more validation rules "
  pass <- TRUE
  val_sum <- validate::summary(out)
  if (any(val_sum$fails > 0)) {
    pass <- FALSE
    warning(warn_base, "had failures")
  }
  if (any(val_sum$error)) {
    pass <- FALSE
    warning(warn_base, "resulted in an error")
  }
  if (any(val_sum$warning)) {
    pass <- FALSE
    warning(warn_base, "resulted in a warning")
  }

  return(invisible(pass))
}
