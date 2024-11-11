# lnorm_param

test_that("lnorm_param returns correct values", {
  expect_equal(
    lnorm_param(100000, 20000000, 1425000),
    list(meanlog = 14.1620841482442, sdlog = 1.61057412031483, mdiff = 0.00762716319082979),
    tolerance = testthat_tolerance()
  )
})

# calc_risk

test_that("calc_risk returns correct values", {
  test_calc <- withr::with_seed(
    429406278, calc_risk("Loss of Customer", 2.0, 14.162084, 1.610574, runs = 10)
  )
  expected_years <- 1:10
  expected_risks <- rep("Loss of Customer", 10)
  expected_events <- c(2L, 4L, 1L, 1L, 1L, 1L, 1L, 3L, 2L, 2L)
  expected_losses <- c(
    4907733.51446033, 13378340.3529084, 428313.785080057, 361303.191424744, 3128642.89100821,
    612488.109468346, 282501.946052545, 975331.279185062, 3196270.50880458, 29306315.9579857
  )

  expect_identical(test_calc$year, expected_years)
  expect_identical(test_calc$risk, expected_risks)
  expect_identical(test_calc$events, expected_events)
  expect_equal(test_calc$losses, expected_losses, tolerance = testthat_tolerance())
})

# gmean

test_that("gmean returns correct values", {
  values <- c(1L, 2L, 4L, 8L, 16L, 32L)
  expect_equal(gmean(values), 5.656854249492, tolerance = testthat_tolerance())
  expect_identical(gmean(0:1e5, zero.rm = FALSE), 0)
})

test_that("gmean strips zeros by default", {
  values <- c(1L, 2L, 4L, 8L, 16L, 32L, 0L, 0L, 0L)
  expect_equal(gmean(values), 5.656854249492, tolerance = testthat_tolerance())
})

test_that("gmean returns NaN with negative numbers", {
  values <- c(-1L, 1L, 2L, 4L, 8L, 16L, 32L)
  expect_warning(gmean(values), "NaNs produced")
  expect_identical(suppressWarnings(gmean(values)), NaN)
})
