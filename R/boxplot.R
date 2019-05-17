boxplot.formula = function(formula, data = NULL, ..., subset, na.action = NULL,
                            drop = FALSE, sep = ".", lex.order = FALSE) {
  if (missing(formula) || (length(formula) != 3L))
    stop("'formula' missing or incorrect")
  m <- match.call(expand.dots = FALSE)
  if (is.matrix(eval(m$data, parent.frame())))
    m$data <- as.data.frame(data)
  m$... <- m$drop <- m$sep <- m$lex.order <- NULL
  m$na.action <- na.action
  m[[1L]] <- quote(stats::model.frame)
  mf <- eval(m, parent.frame())
  response <- attr(attr(mf, "terms"), "response")
  args = list(...)
  args$x = split(mf[[response]], mf[-response], drop = drop,
                 sep = sep, lex.order = lex.order)
  do.call(boxplot.prettyB, args)
}

#' @title PrettyB boxplot.default function
#'
#' @description This function overrides the default arguments. See
#' \code{?graphics::boxplot.default}
#' @param x,...,range,width See \code{?graphics::boxplot.default}
#' @param varwidth,notch,outline See \code{?graphics::boxplot.default}
#' @param names,plot,border See \code{?graphics::boxplot.default}
#' @param col,log,pars See \code{?graphics::boxplot.default}
#' @param horizontal,add,at See \code{?graphics::boxplot.default}
#' @importFrom graphics boxplot
#' @export
boxplot.prettyB = function(x, ..., range = 1.5, width = NULL, varwidth = FALSE,
                            notch = FALSE, outline = TRUE, names,
                            plot = TRUE, border = par("fg"),
                            col = NULL, log = "",
                            pars = list(boxwex = 0.8, staplewex = 0.5,
                                        outwex = 0.5),
                            horizontal = FALSE, add = FALSE, at = NULL) {
  if (class(x) == "formula") {
    args = list(...)
    x = do.call(boxplot.formula, args)
  }
  setup_prettyB()
  ## Grab parameters
  args = list(...)
  args$x = x; args$range = range; args$width = width
  args$varwidth = varwidth; args$notch = notch; args$outline = outline
  if (!missing(names)) args$names = names
  args$plot = plot; args$border = border; args$log = log
  args$pars = pars; args$horizontal = horizontal; args$add = add
  args$at = at

  # Grab titles then at the end
  main = args$main; sub = args$sub
  args$main = args$sub = NULL

  # Parameters to be changed
  args$col = if (missing(col)) 1 else col
  args$border = if (missing(border)) "grey30" else border
  ## XXX: Needs split up. Could have a mixture here of pars & not pars args
  if (missing(pars)) {
    args$boxwex = if (is.null(args$boxwex)) 0.7 else args$boxwex
    args$staplewex = if (is.null(args$staplewex)) 0.35 else args$staplewex
    args$outwex = if (is.null(args$outwex)) 0.35 else args$outwex
    args$boxlwd = if (is.null(args$boxlwd)) 0.1 else args$boxlwd
    args$medlwd = if (is.null(args$medlwd)) 2 else args$medlwd
    args$whisklty = if (is.null(args$whisklty)) 1 else args$whisklty
  } else {
    args$boxwex = if (is.null(pars$boxwex)) 0.7 else pars$boxwex
    args$staplewex = if (is.null(pars$staplewex)) 0.35 else pars$staplewex
    args$outwex = if (is.null(pars$outwex)) 0.35 else pars$outwex
    args$boxlwd = if (is.null(pars$boxlwd)) 0.1 else pars$boxlwd
    args$medlwd = if (is.null(pars$medlwd)) 2 else pars$medlwd
    args$whisklty = if (is.null(pars$whisklty)) 1 else pars$whisklty
  }

  ## Plot first to get dimensions
  args$axes = args$plot = FALSE
  box_out = do.call(graphics::boxplot.default, args)
  if (isFALSE(plot)) return(box_out)
  args$plot = TRUE

  ## Create axis: need to consider
  ## log, horizontal, & at parameters
  ## XXX: Fix log axis
  at =  if (!is.null(at)) at else NULL
  xlim = if (!is.null(args$xlim)) args$xlim else NULL
  ylim = if (!is.null(args$ylim)) args$ylim else NULL

  ## Axis labels
  if (isFALSE(args$horizontal)) {
    number_axis = get_number_axis(ylim, box_out, args$log)
    name_axis = get_name_axis(at, xlim, args$boxwex, box_out, args$log)
  } else {
    # Horizontal: xlim -> ylim & ylim -> xlim!
    number_axis = get_number_axis(ylim, box_out, args$log)
    name_axis = get_name_axis(at, xlim, args$boxwex, box_out, args$log)
  }
  args$xlim  = name_axis$lim; args$ylim = number_axis$lim
  ticks_names = name_axis$ticks; ticks_numbers = number_axis$ticks

  ## Add grid lines
  if (isFALSE(add)) {
    args$yaxt = "n"
    box_out = do.call(graphics::boxplot.default, args)
    #if (is_y(log)) {
    #  ticks_y = axTicks(2)
    #}
    if (isTRUE(args$horizontal)) {
      grid_lines_v(ticks_numbers)
    } else {
      grid_lines_h(ticks_numbers)
    }
  }

  args$yaxt = NULL; args$add = TRUE
  box_out = do.call(graphics::boxplot.default, args)
  ## Add axis & title
  if (isFALSE(add)) {
    if (isTRUE(args$horizontal)) {
      add_x_axis(ticks_numbers, tick = FALSE)
      add_y_axis(ticks_names, labels = box_out$names, tick = TRUE, lwd = 0,
                 lwd.ticks = 1)
    } else {
      add_x_axis(ticks_names, labels = box_out$names, tick = TRUE, lwd = 0,
                 lwd.ticks = 1)
      add_y_axis(ticks_numbers, tick = FALSE)
    }
    if (!is.null(main)) add_title(main)
    if (!is.null(sub)) add_sub(sub)
  }
  invisible(box_out)
}

#' @rdname boxplot.prettyB
#' @export
boxplot_p = boxplot.prettyB
