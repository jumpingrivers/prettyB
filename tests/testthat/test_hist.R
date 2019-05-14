test_that("Testing hist", {
  context("histograms")
  set.seed(1)
  x = rlnorm(100)
  testthat::skip_on_travis()
  vdiffr::expect_doppelganger("hist basic", histB(x))
  vdiffr::expect_doppelganger("hist density", histB(x, freq = FALSE))
  vdiffr::expect_doppelganger("hist labels",
                              histB(x, xlab = "X", ylab = "Y",
                                   main = "Main", sub = "Sub"))

})
