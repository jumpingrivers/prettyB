test_that("Testing barplot", {
  context("Barplot")
  testthat::skip_on_travis()
  vdiffr::expect_doppelganger("barplot basic", barplot(VADeaths))
  vdiffr::expect_doppelganger("barplot horiz", barplot(VADeaths, horiz = TRUE))
  vdiffr::expect_doppelganger("barplot labels",
                              barplot(VADeaths, xlab = "X", ylab = "Y",
                                      main = "Main", sub = "Sub"))

})
