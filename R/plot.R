is_x = function(chr) length(grep("x", chr)) > 0
is_y = function(chr) length(grep("y", chr)) > 0
# Extend axis for par(xaxs="i)
extend_axis = function(lim, eps = 0.02) lim + c(-1, 1) * diff(lim) * eps


#' @title PrettyB plot.default function
#'
#' @description  This function overrides the default arguments. See
#' \code{?graphics::plot.default}
#' @param x,y,type,log See \code{?graphics::plot.default}
#' @param xlim,ylim See \code{?graphics::plot.default}
#' @param main,sub,xlab,ylab See \code{?graphics::plot.default}
#' @param ann,axes See \code{?graphics::plot.default}
#' @param frame.plot,panel.first,panel.last See \code{?graphics::plot.default}
#' @param asp See \code{?graphics::plot.default}
#' @param ... See \code{?graphics::plot.default}
#' @importFrom graphics plot.default abline axTicks axis grid par title
#' @importFrom grDevices xy.coords
#' @rdname plot.prettyB
#' @export
plot.prettyB = function(x, y = NULL, type = "p", xlim = NULL, ylim = NULL,
                        log = "", main = NULL, sub = NULL,
                        xlab = NULL, ylab = NULL,
                        ann = par("ann"), axes = TRUE,
                        frame.plot = axes, panel.first = NULL,
                        panel.last = NULL, asp = NA,
                        ...) {
  setup_prettyB()
  xlabel = if (!missing(x)) deparse(substitute(x))
  ylabel = if (!missing(y)) deparse(substitute(y))
  xy = xy.coords(x, y, xlabel, ylabel, log)
  xlab = if (is.null(xlab)) xy$xlab else xlab
  ylab = if (is.null(ylab)) xy$ylab else ylab

  #theme = current$theme
  ## Expand plot
  # op = set_par_minimal()
  # on.exit(par(op))

  ## Do we have a y?
  if (is.null(y)) {
    x_tmp = 1:length(x)
    y_tmp = x
  } else {
    x_tmp = x
    y_tmp = y
  }

  ## Now check for log scales
  if (is.null(xlim) && is_x(log)) {
    xlim = extend_axis(range(x_tmp))
  }

  if (is.null(xlim)) {
    ticks_x = pretty(x_tmp)
    xlim = extend_axis(range(ticks_x))
  } else {
    ticks_x = pretty(c(xlim, x_tmp))
    xlim = range(ticks_x)
  }

  ## Now check for log scales
  if (is.null(ylim) && is_y(log)) {
    ylim = extend_axis(range(y_tmp))
  }

  if (is.null(ylim)) {
    ticks_y = pretty(y_tmp)
    ylim = extend_axis(range(ticks_y))
  } else {
    ticks_y = pretty(c(ylim, y_tmp))
    ylim = range(ticks_y)
  }

  # Unchanged Arguments
  args = list(...)
  args$x = x
  args$y = y
  args$type = type
  args$log = log
  args$xlab = xlab
  args$ylab = ylab
  args$ann = ann
  args$frame.plot = FALSE
  args$panel.last = panel.last
  args$asp = asp

  # Changed Args
  args$xlim = xlim
  args$ylim = ylim
  args$main = NULL
  args$sub = NULL
  args$axes = FALSE
  args$panel.first = substitute(grid_lines_h(ticks_y))

  if (is.null(args$pch)) args$pch = 21
  if (is.null(args$bg)) args$bg = 1

  # Call to default plot
  do.call(graphics::plot.default, args)

  ## Now add in tick marks and labels
  if (is_x(log)) {
    ticks_x = axTicks(1)
  }
  if (is_y(log)) {
    ticks_y = axTicks(2)
  }

  # Add axis & title
  add_x_axis(ticks_x)
  add_y_axis(ticks_y, tick = FALSE)
  add_title(main)
  add_sub(sub)
  invisible(NULL)
}

#' @rdname plot.prettyB
#' @export
plot_p = plot.prettyB
