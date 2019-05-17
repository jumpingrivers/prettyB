test_that("Testing barplot", {
  context("Barplot")
  testthat::skip_on_travis()
  vdiffr::expect_doppelganger("barplot basic",
                              barplot_p(VADeaths))
  vdiffr::expect_doppelganger("barplot horiz",
                              barplot_p(VADeaths, horiz = TRUE))
  vdiffr::expect_doppelganger("barplot labels",
                              barplot_p(VADeaths, xlab = "X", ylab = "Y",
                                      main = "Main", sub = "Sub"))

})
