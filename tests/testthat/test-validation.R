# check_validation

test_that("check_validation raises warnings for failures, errors, or warnings", {
  out <- NULL
  warn_base <- "^one or more validation rules "
  warn_fail <- paste0(warn_base, "had failures$")
  warn_err <- paste0(warn_base, "resulted in an error$")
  warn_warn <- paste0(warn_base, "resulted in a warning$")

  all_pass <- data.frame(
    name = c("rule1", "rule2"),
    items = c(1L, 4L),
    passes = c(1L, 4L),
    fails = c(0L, 0L),
    nNA = c(0L, 1L),
    error = c(FALSE, FALSE),
    warning = c(FALSE, FALSE),
    expression = c("expr1", "expr2"),
    stringsAsFactors = FALSE
  )
  local_mocked_bindings(summary = function(...) all_pass, .package = "validate")
  expect_no_warning(check_validation(out))
  expect_true(check_validation(out))

  has_fail <- data.frame(
    name = c("rule1", "rule2"),
    items = c(1L, 4L),
    passes = c(1L, 4L),
    fails = c(0L, 1L),
    nNA = c(0L, 1L),
    error = c(FALSE, FALSE),
    warning = c(FALSE, FALSE),
    expression = c("expr1", "expr2"),
    stringsAsFactors = FALSE
  )
  local_mocked_bindings(summary = function(...) has_fail, .package = "validate")
  expect_warning(check_validation(out), warn_fail)
  expect_false(suppressWarnings(check_validation(out)))

  has_err <- data.frame(
    name = c("rule1", "rule2"),
    items = c(1L, 4L),
    passes = c(1L, 4L),
    fails = c(0L, 0L),
    nNA = c(0L, 1L),
    error = c(FALSE, TRUE),
    warning = c(FALSE, FALSE),
    expression = c("expr1", "expr2"),
    stringsAsFactors = FALSE
  )
  local_mocked_bindings(summary = function(...) has_err, .package = "validate")
  expect_warning(check_validation(out), warn_err)
  expect_false(suppressWarnings(check_validation(out)))

  has_warn <- data.frame(
    name = c("rule1", "rule2"),
    items = c(1L, 4L),
    passes = c(1L, 4L),
    fails = c(0L, 0L),
    nNA = c(0L, 1L),
    error = c(FALSE, FALSE),
    warning = c(FALSE, TRUE),
    expression = c("expr1", "expr2"),
    stringsAsFactors = FALSE
  )
  local_mocked_bindings(summary = function(...) has_warn, .package = "validate")
  expect_warning(check_validation(out), warn_warn)
  expect_false(suppressWarnings(check_validation(out)))
})
