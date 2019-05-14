test_that("Testing barplot", {
  context("Barplot")
  testthat::skip_on_travis()
  vdiffr::expect_doppelganger("barplot basic", barplotB(VADeaths))
  vdiffr::expect_doppelganger("barplot horiz", barplotB(VADeaths, horiz = TRUE))
  vdiffr::expect_doppelganger("barplot labels",
                              barplotB(VADeaths, xlab = "X", ylab = "Y",
                                      main = "Main", sub = "Sub"))

})
