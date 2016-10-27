#' @importFrom graphics plot.default abline axTicks axis grid par title
#' @export "plot.default"
plot.default = function(x, y = NULL, ...) {
  old_args = list(...)

  if(is.null(old_args$xlab)) {
    old_args$xlab = deparse(substitute(x))
  }


  if(is.null(old_args$ylab)) {
    if(!is.null(y)) {
      old_args$ylab = deparse(substitute(y))
    } else if (is.null(y)) {
      old_args$ylab = old_args$xlab
      old_args$xlab = NULL
    }
  }
  theme = cache$theme
  if(theme == "expand") {
    do.call(plot_expand, c(list(x,y), old_args))
  } else if(theme == "minimal") {
    do.call(plot_minimal, c(list(x,y), old_args))
  }
}



















