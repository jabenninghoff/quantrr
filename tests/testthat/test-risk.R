# lnorm_param

test_that("lnorm_param returns correct values", {
  expect_equal(
    lnorm_param(100000, 20000000, 1425000),
    list(meanlog = 14.1620841482442, sdlog = 1.61057412031483, mdiff = 0.00762716319082979),
    tolerance = testthat_tolerance()
  )
})

# calc_risk

# TODO: create a valid unit test
