# build_sample

test_that("sample report is expected size", {
  skip_on_ci()
  skip_on_cran()
  skip_on_covr()
  withr::local_dir("../..")

  # suppress warning about incomplete last line
  w_lines <- suppressWarnings(length(readLines("pkgdown/assets/sample/analysis/widgetsys.html")))
  # as of 2025-08-18, widgetsys.html is 3047 lines, expect 3050 lines with a 10% margin of error
  exp_lines <- 3050
  expect_lte(w_lines, exp_lines * 1.1)
  expect_gte(w_lines, exp_lines * 0.9)
})
