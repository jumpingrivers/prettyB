test_that("Testing hist", {
  context("histograms")
  set.seed(1)
  x = rlnorm(100)
  testthat::skip_on_travis()
  vdiffr::expect_doppelganger("hist basic", hist_p(x))
  vdiffr::expect_doppelganger("hist density", hist_p(x, freq = FALSE))
  vdiffr::expect_doppelganger("hist labels",
                              hist_p(x, xlab = "X", ylab = "Y",
                                   main = "Main", sub = "Sub"))

})
