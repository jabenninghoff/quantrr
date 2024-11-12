#' Build quantrr sample report
#'
#' Clean and build quantrr sample report. By default, it will:
#' 1. Delete quarto `_freeze` directory from `input`
#' 1. Delete destination (output) directory
#' 1. Build the sample report using [quarto::quarto_render()]
#' 1. Copy rendered site to destination (output) directory
#'
#' `build_sample()` will fail if quantrr hasn't been installed locally using RStudio > Build >
#'   Install
#'
#' @param input The input file or directory to be rendered using [quarto::quarto_render()].
#' @param output The destination directory to copy the rendered files.
#' @param as_job Render as an RStudio background job.
#' @param clean Clean intermediate and final directories before building.
#'
#' @keywords internal
#' @noRd
build_sample <- function(input = "standalone",
                         output = "pkdown/assets/sample",
                         as_job = FALSE,
                         clean = TRUE) {
  freeze <- fs::path_join(c(input, "_freeze"))
  rendered <- fs::path_join(c(input, "html"))

  if (clean) {
    if (fs::dir_exists(freeze)) fs::dir_delete(freeze)
    if (fs::dir_exists(output)) fs::dir_delete(output)
  }
  quarto::quarto_render(input = input, as_job = as_job)
  fs::dir_copy(rendered, output)
}
