test_that("Testing plotting", {
  context("Plot only x")
  vdiffr::expect_doppelganger("Plot x", plot(1:10))
  vdiffr::expect_doppelganger("Plot x-xlab", plot(1:10, xlab = "X"))
  vdiffr::expect_doppelganger("Plot x-ylab", plot(1:10, ylab = "Y"))
  vdiffr::expect_doppelganger("Plot x-xlab-ylab", plot(1:10, xlab = "X", ylab = "Y"))

  context("Checking par")
  vdiffr::expect_doppelganger("Plot x-y-par-mfrow", {
    op = par(mfrow=c(1, 2))
    plot(1:10, 11:20)
    plot(1:10, xlab = "X")
    par(op)})

  vdiffr::expect_doppelganger("Plot x-y", plot(1:10, 11:20))
  vdiffr::expect_doppelganger("Plot x-y-xlab", plot(1:10, 11:20, xlab = "X"))
  vdiffr::expect_doppelganger("Plot x-y-ylab", plot(1:10, 11:20, ylab = "Y"))
  vdiffr::expect_doppelganger("Plot x-y-xlab-ylab", plot(1:10, 11:20, xlab = "X", ylab = "Y"))

  context("Check formula")
  vdiffr::expect_doppelganger("Plot x-y-formula", plot(iris$Sepal.Length ~ iris$Sepal.Width)
)

})
