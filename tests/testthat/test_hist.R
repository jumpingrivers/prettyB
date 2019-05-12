test_that("Testing hist", {
  context("histograms")
  set.seed(1)
  x = rlnorm(100)
  testthat::skip_on_travis()
  vdiffr::expect_doppelganger("hist basic", hist(x))
  vdiffr::expect_doppelganger("hist density", hist(x, freq = FALSE))
  vdiffr::expect_doppelganger("hist labels",
                              hist(x, xlab = "X", ylab = "Y",
                                   main = "Main", sub = "Sub"))

})
