#' @export
hist.default = function(x, breaks = "Sturges", freq = NULL, probability = !freq,
                        include.lowest = TRUE, right = TRUE, density = NULL, angle = 45,
                        col = NULL, border = NULL, main = paste("Histogram of", xname),
                        xlim = range(breaks), ylim = NULL, xlab = xname, ylab, axes = TRUE,
                        plot = TRUE, labels = FALSE, nclass = NULL, warn.unused = TRUE,
                        ...) {

  op = set_par_minimal()
  on.exit(par(op))

  xname = paste(deparse(substitute(x), 500), collapse = "\n")
  # Unchanged Arguments
  args = list(...)
  args$x = x

  args$freq = freq
  if (!missing(probability)) args$probability = probability
  args$include.lowest = include.lowest
  args$right = right
  args$density = density
  args$angle = angle
  args$main = main
  args$xlim = xlim

  args$xlab = xlab

  args$axes = axes
  args$plot = plot
  args$labels = labels
  args$nclass = nclass
  args$warn.unused = warn.unused

  # Changed
  args$breaks = if (missing(breaks)) "Freedman-Diaconis" else breaks
  args$col = if (missing(col)) 1 else col
  args$border = if (missing(border)) "white" else border
  args$plot = FALSE
  args$ylim = ylim
  hist_out = suppressWarnings(do.call(graphics::hist.default, args))

  if (missing(ylab))
    args$ylab <- if (!hist_out$equidist) "Density" else "Frequency"
  else args$ylab = ylab
  message(args$ylab)

  args$plot = plot

  if (is.null(args$freq) || isTRUE(args$freq)) {
    ticks_y = pretty(c(hist_out$counts, args$ylim, 0))
  } else {
    ticks_y = pretty(c(hist_out$counts/sum(hist_out$counts, args$ylim, 0)))
  }

  if (is.null(args$ylim)) {
    args$ylim = range(ticks_y)
  }

  ticks_x = pretty(c(hist_out$breaks, args$xlim))
  if (is.null(args$xlim)) {
    args$xlim = range(ticks_x)
  }
  args$axes = FALSE


  ## Don't display title - use title()
  args$main = " "
  plot.default(0, type = "n",
               xlim = args$xlim, ylim = args$ylim,
               bty = "n", axes = FALSE,
               ylab = args$ylab, xlab = args$xlab,
               panel.first = abline(h = ticks_y, col = "grey90", lty = 2))

  args$add = TRUE
  hist_out = do.call(graphics::hist.default, args)

  abline(0, 0, col = "white")

  axis(1,ticks_x, ticks_x,
       tick = TRUE,
       lwd = 0,
       lwd.ticks = 1, col.axis = "grey30", col.ticks = "grey20")
  axis(2, ticks_y, ticks_y, tick = FALSE, las = 1, col.axis = "grey30", col.ticks = "grey20")
  title(main, adj = 1, cex.main = 1.1, font.main = 2,
        col.main = "grey20")

  invisible(hist_out)
}
