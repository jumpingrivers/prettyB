test_that("Testing boxplot", {
  context("Boxplot")
  set.seed(1)
  x = rlnorm(100)
  testthat::skip_on_travis()
  vdiffr::expect_doppelganger("Boxplot basic", boxplotB(x))
  vdiffr::expect_doppelganger("Boxplot horiz", boxplotB(x, horizontal = TRUE))
  vdiffr::expect_doppelganger("Boxplot labels",
                              boxplotB(x, xlab = "X", ylab = "Y",
                                      main = "Main", sub = "Sub"))
})
