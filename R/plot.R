#' @importFrom graphics plot.default abline axTicks axis grid par title
#' @export
plot.default = function(x, y = NULL, ...) {
  theme = cache$theme
  if(theme == "expand") {
    plot_expand(x, y, ...)
  } else if(theme == "minimal") {
    plot_minimal(x, y, ...)
  }
}



















