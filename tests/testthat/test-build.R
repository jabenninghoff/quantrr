# build_example

test_that("WMS example report is expected size", {
  skip_on_ci()
  skip_on_cran()
  skip_on_covr()
  withr::local_dir("../..")

  # suppress warning about incomplete last line
  example_lines <- suppressWarnings(
    length(readLines("pkgdown/assets/example/analysis/widgetsys.html"))
  )
  # as of 2025-08-18, widgetsys.html is 3047 lines, expect 3050 lines with a 10% margin of error
  expected_lines <- 3050
  expect_lte(example_lines, expected_lines * 1.1)
  expect_gte(example_lines, expected_lines * 0.9)
})

test_that("R Markdown template and WMS example report length match", {
  skip_on_ci()
  skip_on_cran()
  skip_on_covr()
  withr::local_dir("../..")

  # a better test would diff the two files
  template_len <- length(readLines("inst/rmarkdown/templates/report/skeleton/skeleton.Rmd"))
  example_len <- length(readLines("standalone/analysis/widgetsys.Rmd"))

  # as of 2025-08-18, the example report has 5 extra lines
  expect_identical(template_len, example_len - 5L)
})
