
plot_expand = function(x, y = NULL, xlab, ylab, ...) {

  ## Set up par
  op = set_par_expand()
  on.exit(graphics::par(op))

  ## Now args

  new_args = list(pch = 21, bg = 1, xlab = xlab, ylab=ylab)
  old_args = list(...)
  new_args[names(old_args)] = old_args
  if (is.null(y))
    do.call(graphics::plot.default, c(list(substitute(x)), new_args))
  else
    do.call(graphics::plot.default, c(list(substitute(x), substitute(y)), new_args))
}
