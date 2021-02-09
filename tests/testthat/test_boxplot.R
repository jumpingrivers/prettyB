test_that("Testing boxplot", {
  context("Boxplot")
  testthat::skip_on_ci()
  testthat::skip_on_cran()
  set.seed(1)
  x = rlnorm(100)
  expect_doppelganger("Boxplot basic", boxplot_p(x))
  expect_doppelganger("Boxplot horiz", boxplot_p(x, horizontal = TRUE))
  expect_doppelganger("Boxplot labels",
                              boxplot_p(x, xlab = "X", ylab = "Y",
                                      main = "Main", sub = "Sub"))
})
