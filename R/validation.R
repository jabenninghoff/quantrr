#' Check validation results
#'
#' Check results from [validate::confront()] and raise warnings if any validations had failures, or
#'   if any validations resulted in an error or a warning.
#'
#' @param out output from [validate::confront()].
#' @param sheet name of sheet to pass to warning message.
#'
#' @return `FALSE` if the validation had any failures or resulted in any errors or warnings,
#'  otherwise `TRUE`, invisibly.
#' @export
check_validation <- function(out, sheet = NA) {
  pass <- TRUE
  warn_start <- "one or more validation rules "
  warn_loc <- ""
  if (!is.na(sheet)) warn_loc <- paste0(" in sheet '", sheet, "'")
  warn_end <- ", check validation results"

  val_sum <- validate::summary(out)
  if (any(val_sum$fails > 0)) {
    pass <- FALSE
    warning(warn_start, "had failures", warn_loc, warn_end)
  }
  if (any(val_sum$error)) {
    pass <- FALSE
    warning(warn_start, "resulted in an error", warn_loc, warn_end)
  }
  if (any(val_sum$warning)) {
    pass <- FALSE
    warning(warn_start, "resulted in a warning", warn_loc, warn_end)
  }

  return(invisible(pass))
}
