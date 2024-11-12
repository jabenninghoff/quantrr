# check_validation

test_that("check_validation raises warnings for failures, errors, or warnings", {
  out <- NULL
  warn_start <- "^one or more validation rules "
  warn_fail <- "had failures"
  warn_err <- "resulted in an error"
  warn_warn <- "resulted in a warning"
  warn_sheet <- " in sheet 'test'"
  warn_end <- ", check validation results$"

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
  expect_warning(check_validation(out), paste0(warn_start, warn_fail, warn_end))
  expect_warning(
    check_validation(out, sheet = "test"), paste0(warn_start, warn_fail, warn_sheet, warn_end)
  )
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
  expect_warning(check_validation(out), paste0(warn_start, warn_err, warn_end))
  expect_warning(
    check_validation(out, sheet = "test"), paste0(warn_start, warn_err, warn_sheet, warn_end)
  )
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
  expect_warning(check_validation(out), paste0(warn_start, warn_warn, warn_end))
  expect_warning(
    check_validation(out, sheet = "test"), paste0(warn_start, warn_warn, warn_sheet, warn_end)
  )
  expect_false(suppressWarnings(check_validation(out)))
})
