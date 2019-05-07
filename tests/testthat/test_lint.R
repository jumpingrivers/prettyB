test_that("Package Style", {
  context("lints")
  lintr::expect_lint_free()
})
