grid_lines_h = function(locations) {
  abline(h = locations, col = "grey90", lty = 1)
}

grid_lines_v = function(locations) {
  abline(v = locations, col = "grey90", lty = 1)
}

#' @rdname add_y_axis
#' @export
add_x_axis = function(ticks_x, labels = ticks_x, tick = TRUE, lwd = 0,
                      lwd.ticks = 1) {
  axis(1, ticks_x, labels,
       tick = tick, lwd = lwd, lwd.ticks = lwd.ticks,
       col.axis = "grey30", col.ticks = "grey20")
}

#' @title Add tick marks to x/y axis
#'
#' A nicer set of default tick marks
#' @param ticks_y location of y tick mark
#' @param ticks_x location of x tick mark
#' @param labels tick label
#' @param tick Display tick mark
#' @param lwd width of line
#' @param lwd.ticks width of tick mark
#' @export
add_y_axis = function(ticks_y, labels = ticks_y, tick = TRUE, lwd = 0,
                      lwd.ticks = 1) {
  axis(2, ticks_y, labels,
       tick = tick, las = 1, lwd.ticks = lwd.ticks, lwd = lwd,
       col.axis = "grey30", col.ticks = "grey20")
}

add_title = function(main = NULL) {
  if (!is.null(main)) {
    title(main, adj = 1, cex.main = 1.1, font.main = 2,
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
