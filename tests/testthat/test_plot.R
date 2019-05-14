test_that("Testing plot", {
  context("Plotting")
  testthat::skip_on_travis()
  vdiffr::expect_doppelganger("Plot x", plotB(1:10))
  vdiffr::expect_doppelganger("Plot x-xlab", plotB(1:10, xlab = "X"))
  vdiffr::expect_doppelganger("Plot x-ylab", plotB(1:10, ylab = "Y"))
  vdiffr::expect_doppelganger("Plot x-xlab-ylab",
                              plotB(1:10, xlab = "X", ylab = "Y"))

  vdiffr::expect_doppelganger("Plot x-y-par-mfrow", {
    op = par(mfrow = c(1, 2))
    plotB(1:10, 11:20)
    plotB(1:10, xlab = "X")
    par(op)
  }
  )

  vdiffr::expect_doppelganger("Plot x-y", plotB(1:10, 11:20))
  vdiffr::expect_doppelganger("Plot x-y-xlab", plotB(1:10, 11:20, xlab = "X"))
  vdiffr::expect_doppelganger("Plot x-y-ylab", plotB(1:10, 11:20, ylab = "Y"))
  vdiffr::expect_doppelganger("Plot x-y-xlab-ylab",
                              plotB(1:10, 11:20, xlab = "X", ylab = "Y"))

  vdiffr::expect_doppelganger("Plot x-y-formula",
                              plot(iris$Sepal.Length ~ iris$Sepal.Width)
  )

})
