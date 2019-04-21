#' @title Set the current theme
#'
#' Set's the current plotting theme.
#' @param theme Values are "minimal" or "expand"
#' @export
theme_set = function(theme = NULL) {
#  if(!is.null(theme) && !(theme %in% c("minimal", "expand"))) {
#    stop("Theme not recognised.", call. = FALSE)
#  }
  if (!is.null(theme)) current$theme = theme[1]
  invisible(current)
}
