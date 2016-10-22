#' @export "qqnorm.default"
qqnorm.default = function(y, ...) {
  theme = cache$theme
  if(theme == "expand") {
    qqnorm_expand(y, ...)
  } else if(theme == "minimal") {
    qqnorm_minimal(y, ...)
  }
}

#' @importFrom stats qqline
#' @export
qqline = function(y, ...) {
  new_args = list(lty=3, col=2, lwd=2)
  old_args = list(...)
  new_args[names(old_args)] = old_args
  do.call(stats::qqline, c(list(substitute(y)), new_args))
}
