test_that("Testing boxplot", {
  context("Boxplot")
  set.seed(1)
  x = rlnorm(100)
  testthat::skip_on_travis()
  vdiffr::expect_doppelganger("Boxplot basic", boxplot(x))
  vdiffr::expect_doppelganger("Boxplot horiz", boxplot(x, horizontal = TRUE))
  vdiffr::expect_doppelganger("Boxplot labels",
                              boxplot(x, xlab = "X", ylab = "Y",
                                      main = "Main", sub = "Sub"))
})
