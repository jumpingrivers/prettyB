test_that("Testing hist", {
  context("histograms")
  testthat::skip_on_ci()
  testthat::skip_on_cran()
  set.seed(1)
  x = rlnorm(100)
  expect_doppelganger("hist basic", hist_p(x))
  expect_doppelganger("hist density", hist_p(x, freq = FALSE))
  expect_doppelganger("hist labels",
                              hist_p(x, xlab = "X", ylab = "Y",
                                   main = "Main", sub = "Sub"))

})
