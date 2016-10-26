#' @importFrom graphics hist.default
#' @export "hist.default"
hist.default = function(x, ...) {
  theme = cache$theme
  if(theme == "expand") {
    hist_expand(x, ...)
  } else if(theme == "minimal") {
    hist_minimal(x, ...)
  }
}



