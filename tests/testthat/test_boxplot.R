test_that("Testing boxplot", {
  context("Boxplot")
  set.seed(1)
  x = rlnorm(100)
  testthat::skip_on_travis()
  vdiffr::expect_doppelganger("Boxplot basic", boxplot_p(x))
  vdiffr::expect_doppelganger("Boxplot horiz", boxplot_p(x, horizontal = TRUE))
  vdiffr::expect_doppelganger("Boxplot labels",
                              boxplot_p(x, xlab = "X", ylab = "Y",
                                      main = "Main", sub = "Sub"))
})
