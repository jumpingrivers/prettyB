get_pretty_ticks = function(z, log) {

  ## Pretty doesn't work on log scale
  if(log) {
    ticks = axTicks(side)
  } else {
    ticks = pretty(z)
  }
  return(ticks)
}



#' @importFrom graphics plot.default
#' @export "plot.default"
plot.default = function(x, y = NULL, ...) {
  theme = cache$theme
  if(theme == "expand") {
    plot_expand(x, y, ...)
  } else if(theme == "minimal") {
    plot_minimal(x, y, ...)
  }
}



















