#' @title PrettyB barplot.default function
#'
#' @description  This function overrides the default arguments. See
#' \code{?graphics::barplot.default}
#' @param height,width,space See \code{?graphics::barplot.default}
#' @param names.arg,legend.text,beside See \code{?graphics::barplot.default}
#' @param horiz,density,angle,col See \code{?graphics::barplot.default}
#' @param border,main,sub,xlab,ylab See \code{?graphics::barplot.default}
#' @param xlim,ylim,xpd,log,axes See \code{?graphics::barplot.default}
#' @param axisnames,cex.axis,cex.names See \code{?graphics::barplot.default}
#' @param inside,plot,axis.lty See \code{?graphics::barplot.default}
#' @param offset,add,args.legend See \code{?graphics::barplot.default}
#' @param ... See \code{?graphics::barplot.default}
#' @importFrom graphics barplot.default barplot
#' @export
#' @examples
#' barplot(VADeaths)
barplot.prettyB = function(height, width = 1, space = NULL, names.arg = NULL,
                           legend.text = NULL, beside = FALSE, horiz = FALSE,
                           density = NULL, angle = 45, col = NULL,
                           border = par("fg"), main = NULL,
                           sub = NULL, xlab = NULL, ylab = NULL,
                           xlim = NULL, ylim = NULL,
                           xpd = TRUE, log = "", axes = TRUE,
                           axisnames = TRUE, cex.axis = par("cex.axis"),
                           cex.names = par("cex.axis"), inside = TRUE,
                           plot = TRUE, axis.lty = 0, offset = 0,
                           add = FALSE, args.legend = NULL, ...) {
  # op = set_par_minimal()
  # on.exit(par(op))
  setup_prettyB()

  # Unchanged Arguments
  args = list(...)
  args$height = height
  args$width = width
  args$space = space
  args$names.arg = names.arg
  args$legend.text = legend.text
  args$beside = beside
  args$horiz = horiz
  args$density = density
  args$angle = angle
  # barplot normally takes care of this
  # But we do a pass through plot first for grid lines
  args$xlab = if (missing(xlab)) NA else xlab
  args$ylab = if (missing(ylab)) NA else ylab
  args$xpd = xpd
  args$log = log
  args$axisnames = axisnames
  args$cex.axis = cex.axis
  args$cex.names = cex.names
  # inside isn't actually implemented
  if (!missing(inside)) args$inside = inside
  args$plot = plot
  args$axis.lty = axis.lty
  args$offset = offset
  args$add = add
  args$args.legend = args.legend

  # Changes
  args$main = NULL # Move to top
  args$sub = NULL # Move to bottom
  if (!is.null(col)) {
    args$col = col
  } else if (is.matrix(height)) {
    args$col = 1:NROW(height)
  } else {
    args$col = 1
  }
  args$border = if (missing(border)) NA else border
  args$axes = if (missing(axes)) FALSE else axes

  args$plot = FALSE
  res = do.call(graphics::barplot.default, args)
  if (isFALSE(plot)) return(res)
  args$plot = TRUE

  # Combinations of horizontal, beside,
  # specified xlim, ylim
  # Used on the "frequency/count" axis
  if (!is.null(xlim) && isTRUE(args$horiz)) {
    ticks = pretty(xlim)
  } else if (!is.null(ylim) && !isTRUE(args$horiz)) {
    ticks = pretty(ylim)
  } else if (is.matrix(height) && isFALSE(beside)) {
    ticks = pretty(c(0, colSums(height)))
  } else {
    ticks = pretty(c(0, height))
  }

  # Find end of rectangles for unequal widths
  rect_up = res + width / 2
  rect_low = res - width / 2
  if (isTRUE(args$horiz)) {
    ticks_x = ticks
    args$xlim = range(ticks_x)
    args$ylim = if (missing(ylim)) range(0, rect_up + rect_low[1]) else ylim
    graphics::plot.default(0, type = "n",
                           ylim = args$ylim,
                           xlim = args$xlim,
                           bty = "n", axes = FALSE,
                           ylab = args$ylab, xlab = args$xlab,
                           panel.first = grid_lines_v(ticks_x))

  } else {
    ticks_y = ticks
    args$xlim = if (missing(xlim)) range(0, rect_up + rect_low[1]) else xlim
    args$ylim = range(ticks_y)
    graphics::plot.default(0, type = "n",
                           xlim = args$xlim,
                           ylim = args$ylim,
                           bty = "n", axes = FALSE,
                           ylab = args$ylab, xlab = args$xlab,
                           panel.first = grid_lines_h(ticks_y))
  }

  # Get axis labels and position
  if (is.matrix(res) && ncol(res) > 1) {
    lab_loc = colMeans(res)
    lab = colnames(height)
  } else {
    lab_loc = res
    if (is.matrix(height) ){
      lab = colnames(height)
    } else {
      lab_loc = res
      lab = names(height)
    }
  }

  if (isTRUE(args$horiz)) {
    add_x_axis(ticks_x, tick = FALSE)
    add_y_axis(lab_loc, labels = lab, tick = FALSE)
  } else {
    add_y_axis(ticks_y, tick = FALSE)
    add_x_axis(lab_loc, labels = lab, tick = FALSE)
  }
  add_title(main)
  add_sub(sub)

  args$add = TRUE
  args$axisnames = FALSE
  res = do.call(graphics::barplot.default, args)
  invisible(res)
}


#' @rdname barplot.prettyB
#' @export
barplot_p = barplot.prettyB
