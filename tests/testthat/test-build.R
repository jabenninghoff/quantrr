# build_sample

test_that("WMS sample report is expected size", {
  skip_on_ci()
  skip_on_cran()
  skip_on_covr()
  withr::local_dir("../..")

  # suppress warning about incomplete last line
  sample_lines <- suppressWarnings(
    length(readLines("pkgdown/assets/sample/analysis/widgetsys.html"))
  )
  # as of 2025-08-18, widgetsys.html is 3047 lines, expect 3050 lines with a 10% margin of error
  expected_lines <- 3050
  expect_lte(sample_lines, expected_lines * 1.1)
  expect_gte(sample_lines, expected_lines * 0.9)
})

test_that("R Markdown template and WMS sample report length match", {
  skip_on_ci()
  skip_on_cran()
  skip_on_covr()
  withr::local_dir("../..")

  # a better test would diff the two files
  template_len <- length(readLines("inst/rmarkdown/templates/report/skeleton/skeleton.Rmd"))
  sample_len <- length(readLines("standalone/analysis/widgetsys.Rmd"))

  # as of 2025-08-18, the sample report has 5 extra lines
  expect_identical(template_len, sample_len - 5L)
})
