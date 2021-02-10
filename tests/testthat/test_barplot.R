test_that("Testing barplot", {
  context("Barplot")
  testthat::skip_on_travis()
  testthat::skip_on_ci()
  testthat::skip_on_cran()
  expect_doppelganger("barplot basic",
                              barplot_p(VADeaths))
  expect_doppelganger("barplot horiz",
                              barplot_p(VADeaths, horiz = TRUE))
  expect_doppelganger("barplot labels",
                              barplot_p(VADeaths, xlab = "X", ylab = "Y",
                                      main = "Main", sub = "Sub"))

  expect_doppelganger("barplot basic no axisnames",
                      barplot_p(VADeaths, axisnames = FALSE))
})
