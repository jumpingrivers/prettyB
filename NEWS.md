# prettyB 0.2.2 _2021-02-09_
  * Export add_y_axis & add_x_axis tick functions
  * Improved `plot()` logic for the log scale
  * Conditionally use {vdiffr} for testing (CRAN request)
  * Bug: plot matrices fixes #13 (thanks to @gmonaie)
  * BUg: barplot and axisnames. Fixes #14 (thanks to @yikeshu0611)

## Version 0.2.1
  * Bug fix: Don't open plotting window when loading the package
  * Don't override default argument (CRAN request)
  * Implement `hist_p()` method
  * Implement `barplot_p()` method
  * Implement `boxplot_p()` method
  * Play nicely with existing S3 plotting methods, e.g. `plot.lm()`
  * KISS: removed themes. If you want themes, use {ggplot2}
  * Made grid lines solid, instead of dashed
  * Add vignette
  * Update test suite

## Version 0.1.1
  * Adding examples to `?plot`

## Version 0.1.0
  * Initial version

-----

Development of this package was supported by [Jumping
Rivers](https://www.jumpingrivers.com)
