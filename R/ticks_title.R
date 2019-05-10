
grid_lines_h = function(locations) {
  abline(h = locations, col = "grey90", lty = 1)
}

grid_lines_v = function(locations) {
  abline(v = locations, col = "grey90", lty = 1)
}

add_x_axis = function(ticks_x, labels = ticks_x, tick = TRUE) {
  axis(1,
       ticks_x, labels,
       tick = tick, lwd = 0, lwd.ticks = 1,
       col.axis = "grey30", col.ticks = "grey20")
}

add_y_axis = function(ticks_y, labels = ticks_y, tick = TRUE) {
  axis(2,
       ticks_y, labels,
       tick = tick, las = 1,
       col.axis = "grey30", col.ticks = "grey20")
}

add_title = function(main = NULL) {
  if (!is.null(main)) {
    title(main,
          adj = 1, cex.main = 1.1, font.main = 2,
          col.main = par("col.main"))
  }
}

add_sub = function(sub = NULL) {
  if (!is.null(sub)) {
    title(sub = sub,
          adj = 1, cex.sub = 0.8, font.sub = 1,
          col.sub = par("col.main"),
          mgp = c(0.2, 0, 0))
  }
}
