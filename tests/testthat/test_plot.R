test_that("Testing plot", {
  context("Plotting")
  testthat::skip_on_ci()
  testthat::skip_on_cran()
  expect_doppelganger("Plot x", plot_p(1:10))
  expect_doppelganger("Plot x-xlab", plot_p(1:10, xlab = "X"))
  expect_doppelganger("Plot x-ylab", plot_p(1:10, ylab = "Y"))
  expect_doppelganger("Plot x-xlab-ylab",
                      plot_p(1:10, xlab = "X", ylab = "Y"))

  expect_doppelganger("Plot x-y-par-mfrow", {
    op = par(mfrow = c(1, 2))
    plot_p(1:10, 11:20)
    plot_p(1:10, xlab = "X")
    par(op)
  }
  )

  expect_doppelganger("Plot x-y", plot_p(1:10, 11:20))
  expect_doppelganger("Plot x-y-xlab", plot_p(1:10, 11:20, xlab = "X"))
  expect_doppelganger("Plot x-y-ylab", plot_p(1:10, 11:20, ylab = "Y"))
  expect_doppelganger("Plot x-y-xlab-ylab",
                              plot_p(1:10, 11:20, xlab = "X", ylab = "Y"))

  expect_doppelganger("Plot x-y-formula",
                              plot(iris$Sepal.Length ~ iris$Sepal.Width)
  )

  ## Testing matrix
  x = matrix(c(41:60, 11:30, 51:70), ncol = 3)
  expect_doppelganger("Plot x-y-mat", plot_p(x))
  expect_doppelganger("Plot x-y-mat-single-vector", plot_p(x[, 1], 1:20))
  expect_doppelganger("Plot x-y-mat-single", plot_p(x[, 1]))

})
