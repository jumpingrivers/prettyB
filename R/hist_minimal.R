hist_minimal = function(x, ...) {
  ## Set up par
  op = set_par_minimal()
  on.exit(graphics::par(op))

  ## Now args
  new_args = list(breaks = "Freedman-Diaconis")
  old_args = list(...)
  new_args[names(old_args)] = old_args
  do.call(graphics::hist.default, c(list(substitute(x)), new_args))
}
