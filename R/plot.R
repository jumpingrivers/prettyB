#' PrettyB's plotting function
#'
#' PrettyB's redefined plotting functions
#' @param x x parameter passed to plot
#' @param y y parameter passed to plot
#' @param ... other parameters passed to plot
#' @export
#' @import graphics stats
#' @rdname plot
#' @examples
#' # PrettyB overloads standard plotting functions
#' plot(1:10)
#' # All arguments still work as expect
#' plot(iris$Sepal.Length, iris$Sepal.Width, bg = "red")
#' # Use par as usual
#' op = par(mfrow = c(1, 2))
#' plot(rnorm(10), xlab = "X")
#' plot(rnorm(10), main = "A title")
#' par(op)
plot = function (x, y, ...) UseMethod("plot")

## XXX: Make formula pretty - need to grab x & y
#' @method plot formula
#' @export
plot.formula = graphics:::plot.formula

#' @importFrom graphics plot.default abline axTicks axis grid par title
#' @method plot default
#' @rdname plot
#' @export
plot.default = function(x, y = NULL, ...) {
  old_args = list(...)

  if(is.null(old_args$xlab) && !is.null(y)) { # Match plot(x, y)
    old_args$xlab = deparse(substitute(x))
  } else if(is.null(old_args$xlab) && is.null(y)) {# Match plot(x) style
    old_args$xlab = "Index"
  }

  if(is.null(old_args$ylab)) {
    if(!is.null(y)) { # Match plot(x, y)
      old_args$ylab = deparse(substitute(y))
    } else if (is.null(y)) { # Match plot(x) style
      old_args$ylab = deparse(substitute(x))
    }
  }

  theme = current$theme
  if(theme == "expand") {
    do.call(plot_expand, c(list(x, y), old_args))
  } else if(theme == "minimal") {
    do.call(plot_minimal, c(list(x, y), old_args))
  }
}



















