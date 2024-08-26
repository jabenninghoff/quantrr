# adapted from https://github.com/ropensci/spelling/blob/master/R/spell-check.R
pkg_dir <- list.files("../../00_pkg_src", full.names = TRUE)
if (!length(pkg_dir)) {
  # This is where it is on e.g. win builder
  check_dir <- dirname(dirname(getwd()))
  if (endsWith(check_dir, ".Rcheck")) {
    source_dir <- sub("\\.Rcheck$", "", check_dir)
    if (file.exists(source_dir)) {
      pkg_dir <- source_dir
    }
  }
}
if (
  !length(pkg_dir) && identical(basename(getwd()), "testthat") && file.exists("../../DESCRIPTION")
) {
  pkg_dir <- dirname(dirname(getwd()))
}

test_that("Package has no spelling errors", {
  skip_on_cran()
  skip_on_covr()
  withr::local_dir(pkg_dir)
  expect_identical(spelling::spell_check_package()$word, character(0))
})

test_that("Notebooks have no spelling errors", {
  skip_on_cran()
  skip_on_covr()
  withr::local_dir(pkg_dir)
  if (fs::dir_exists("analysis")) {
    # spell_check_notebooks()$word is NULL if there are no notebooks or only empty notebooks
    results <- rdev::spell_check_notebooks()
    expect_true(is.null(results$word) || identical(results$word, character(0)))
  } else {
    expect_error(rdev::spell_check_notebooks(), "^'analysis' directory not found$")
  }
})
