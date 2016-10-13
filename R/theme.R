#' @export
theme_set = function(theme = "expand") {
  cache$theme = theme
  invisible(NULL)
}