#' @importFrom graphics plot.default abline axTicks axis grid par title
#' @export "plot.default"
plot.default = function(x, y = NULL, ...) {
  xlab = deparse(substitute(x))
  if(!is.null(y)) {
    ylab = deparse(substitute(y))
  } else {
    ylab = xlab
    xlab = NULL
  }
  theme = cache$theme
  if(theme == "expand") {
    plot_expand(x, y, xlab=xlab, ylab=ylab, ...)
  } else if(theme == "minimal") {
    plot_minimal(x, y, xlab=xlab, ylab=ylab, ...)
  }
}



















