#'
#' #' @importFrom graphics barplot.default barplot
#' #' @export "barplot.default"
#' barplot.default = function(height, ...) {
#'   theme = cache$theme
#'   if(theme == "expand") {
#'     barplot_expand(height, ...)
#'   } else if(theme == "minimal") {
#'     barplot_minimal(height, ...)
#'   }
#' }
#'
