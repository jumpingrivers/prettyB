is_x = function(chr) length(grep("x", chr)) > 0
is_y = function(chr) length(grep("y", chr)) > 0


plot_minimal = function(x, y = NULL, ...) {
  ## Expand plot
  op = set_par_minimal()
  on.exit(par(op))

  ## Grab ...
  old_args = list(...)

  ## Do we have a y?
  if(is.null(y)) {
    x_tmp = 1:length(x)
    y_tmp = x
  } else {
    x_tmp = x
    y_tmp = y
  }

  xlim = old_args$xlim
  ## Now check for log scales
  if(is.null(xlim) &&  is_x(old_args$log)) {
      xlim = range(x_tmp) *1.05
  }

  if(is.null(xlim)) {
    ticks_x = pretty(x_tmp)
    xlim = range(ticks_x)*1.05
  } else {
    ticks_x = pretty(c(xlim, x_tmp))
  }

  ylim = old_args$ylim
  ## Now check for log scales
  if(is.null(ylim) &&  is_y(old_args$log)) {
    ylim = range(y_tmp) *1.05
  }

  if(is.null(ylim)) {
    ticks_y = pretty(y_tmp)
    ylim = range(ticks_y)*1.05
  } else {
    ticks_y = pretty(c(ylim, y_tmp))
  }

  ## Change default args
  new_args = list(pch = 21, bg = 1, axes = FALSE, frame = FALSE,
                  xlim = xlim, ylim = ylim)
  new_args[names(old_args)] = old_args
  new_args$main = NULL

  if (is.null(y))
    do.call(graphics::plot.default, c(list(substitute(x)), new_args))
  else
    do.call(graphics::plot.default, c(list(substitute(x), substitute(y)), new_args))

  if(is_x(old_args$log)) {
    ticks_x = axTicks(1)
  }
  if(is_y(old_args$log)){
    ticks_y = axTicks(2)
  }

  if(is.null(old_args$axes)) {
    # Add axis
    axis(2, ticks_y, ticks_y, tick = FALSE, las = 1)
    abline(h = ticks_y, col = "grey90", lty = 2)
    axis(1,ticks_x, ticks_x,
         tick = TRUE,
         lwd = 0,
         lwd.ticks = 1)
  }
  if(!is.null(old_args$main)) {
    title(old_args$main, adj=1,
          cex.main=1.1, font.main=2, col.main="black")
  }
  invisible(NULL)
}
