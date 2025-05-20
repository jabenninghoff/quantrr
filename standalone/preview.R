# preview standalone site with quarto

# add R to path if needed
if (Sys.info()["sysname"] == "Windows" && !grepl(R.home(), Sys.getenv("PATH"), fixed = TRUE)) {
  # nolint next: undesirable_function_linter.
  Sys.setenv(PATH = paste0(file.path(R.home(), "bin"), ";", Sys.getenv("PATH")))
}

library(quarto)
quarto_preview()
