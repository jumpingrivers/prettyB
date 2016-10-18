#' @export
theme_set = function(theme = "expand") {
  cache$theme = theme
  cache$par = par()
  invisible(cache)
}
