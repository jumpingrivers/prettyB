#' @title PrettyB hist.default function
#'
#' @description  This function overrides the default arguments. See
#' \code{?graphics::hist.default}
#' @param x,breaks,freq,probability See \code{?graphics::hist.default}
#' @param include.lowest,right,density See \code{?graphics::hist.default}
#' @param angle,col,border,main See \code{?graphics::hist.default}
#' @param xlim,ylim,xlab,ylab,axes,plot See \code{?graphics::hist.default}
#' @param labels,nclass,warn.unused See \code{?graphics::hist.default}
#' @param ... See \code{?graphics::hist.default}
#' @export
#' @examples
#' x = rlnorm(100)
#' hist(x)
hist.prettyB = function(x, breaks = "Sturges", freq = NULL, probability = !freq,
                        include.lowest = TRUE, right = TRUE, density = NULL,
                        angle = 45, col = NULL, border = NULL,
                        main = paste("Histogram of", xname),
                        xlim = range(breaks), ylim = NULL,
                        xlab = xname, ylab, axes = TRUE,
                        plot = TRUE, labels = FALSE, nclass = NULL,
                        warn.unused = TRUE,
                        ...) {
  setup_prettyB()
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
  main = if (missing(main)) paste("Histogram of", xname) else main
  args$main = " "
  sub = if (!is.null(args$sub)) args$sub else NULL
  args$sub = NULL
  #args$xlim = xlim # Get xlim from hist_out below

  args$xlab = xlab
  if (!missing(ylab)) args$ylab = ylab
  args$axes = axes
  args$plot = plot
  args$labels = labels
  args$nclass = nclass
  args$warn.unused = warn.unused

  # Changed
  args$breaks = if (missing(breaks)) "Freedman-Diaconis" else breaks
  args$col = if (missing(col)) 1 else col
  args$border = if (missing(border)) "white" else border
  args$ylim = ylim
  if (isTRUE(args$add)) {
    return(do.call(graphics::hist.default, args))
  }
  args$plot = FALSE
  hist_out = suppressWarnings(do.call(graphics::hist.default, args))

  if (hist_out$equidist && (is.null(freq) || isTRUE(freq))) {
    args$freq = TRUE
  } else {
    args$freq = FALSE
  }

  if (is.null(args$ylab)) {
    args$ylab = if (isFALSE(args$freq)) "Density" else "Frequency"
  }
  args$plot = plot

  if (!is.null(args$ylim)) {
    ticks_y = pretty(args$ylim)
  } else  if (is.null(args$freq) || isTRUE(args$freq)) {
    ticks_y = pretty(c(hist_out$counts, 0))
  } else {
    ticks_y = pretty(c(hist_out$density, 0))
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
  graphics::plot.default(0, type = "n",
                         xlim = args$xlim, ylim = args$ylim,
                         bty = "n", axes = FALSE,
                         ylab = args$ylab, xlab = args$xlab,
                         panel.first = grid_lines_h(ticks_y))
  args$add = TRUE
  hist_out = do.call(graphics::hist.default, args)

  abline(0, 0, col = "white")
  add_x_axis(ticks_x)
  add_y_axis(ticks_y, tick = FALSE)
  add_title(main)
  add_sub(sub)

  invisible(hist_out)
}

#' @rdname hist.prettyB
#' @export
hist_p = hist.prettyB
