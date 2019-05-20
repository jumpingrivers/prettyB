test_that("Package Style", {
  context("lints")
  lintr::expect_lint_free(linters = lintr::with_defaults(
    assignment_linter = NULL, # 20
    commented_code_linter = NULL,
    NULL
  ))
})
