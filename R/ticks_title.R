
grid_lines = function(locations) {
  abline(h = locations, col = "grey90", lty = 1)
}
add_x_axis = function(ticks_x) {
  axis(1,
       ticks_x, ticks_x,
       tick = TRUE, lwd = 0, lwd.ticks = 1,
       col.axis = "grey30", col.ticks = "grey20")
}

add_y_axis = function(ticks_y) {
  axis(2,
       ticks_y, ticks_y,
       tick = FALSE, las = 1,
       col.axis = "grey30", col.ticks = "grey20")
}

add_title = function(main) {
  if (!is.null(main)) {
    title(main,
          adj = 1, cex.main = 1.1, font.main = 2,
          col.main = par("col.main"))
  }
}
