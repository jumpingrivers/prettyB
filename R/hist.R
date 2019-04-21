#' #' @importFrom graphics hist.default
#' #' @export "hist.default"
#' hist.default = function(x, ...) {
#'
#'   old_args = list(...)
#'
#'   if(is.null(old_args$xlab)) {
#'     old_args$xlab = deparse(substitute(x))
#'   }
#'
#'   if(is.null(old_args$main)) {
#'     main = paste("Histogram of", deparse(substitute(x)))
#'   }
#'
#'   theme = cache$theme
#'   if(theme == "expand") {
#'     do.call(hist_expand, c(list(x), old_args))
#'   } else if(theme == "minimal") {
#'     do.call(hist_minimal, c(list(x), old_args))
#'   }
#' }
#'
#'
#'
