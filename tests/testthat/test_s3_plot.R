test_that("Testing S3 plot functions", {
  context("Plot only x")
  expect_null(plot(iris$Sepal.Length ~ iris$Sepal.Width))
  expect_null({
    m = lm(1:10 ~ rnorm(10))
    plot(m, which = 1:5, sub.caption = NA, ask = FALSE)
  })
}
)
