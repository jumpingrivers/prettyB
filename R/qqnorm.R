#' stats_qqnorm_default = stats:::qqnorm.default
#'
#' #' @method qqnorm default
#' #' @export
#' qqnorm.default = function(y, ...) {
#'   theme = current$theme
#'   if(theme == "expand") {
#'     qqnorm_expand(y, ...)
#'   } else if(theme == "minimal") {
#'     qqnorm_minimal(y, ...)
#'   }
#' }
#'
#' #' Replacement for qqline
#' #'
#' #' See ?stats::qqline for details
#' #' @param y The second or only data sample.
#' #' @param ... Graphical parameters passed to \code{stats::qqline}.
#' #' @importFrom stats qqline
#' #' @export
#' qqline = function(y, ...) {
#'   new_args = list(lty = 3, col =2, lwd = 2)
#'   old_args = list(...)
#'   new_args[names(old_args)] = old_args
#'   do.call(stats::qqline, c(list(substitute(y)), new_args))
#' }
