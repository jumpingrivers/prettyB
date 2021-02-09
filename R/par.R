#' Set up par and palette
#'
#' Sets up par and palette
#' @export
reset_prettyB = function() {
  if (!is.null(cache$par)) {
    graphics::par(cache$par)
    cache$par = NULL
  }
  if (!is.null(cache$palette)) {
    palette(cache$palette)
    cache$palette = NULL
  }
}

#' @rdname reset_prettyB
#' @export
setup_prettyB = function() {
  new_par = list(mar = c(3, 3, 2, 1), mgp = c(2, 0.4, 0), tck = -.01,
                 cex.axis = 0.9, las = 1,
                 xaxs = "i", yaxs = "i",
                 col.lab = "grey50", col.main = "grey20",
                 pch = 21, col = 1, lwd = 1.5)
  new_par_names = names(new_par)
  cur_par = par(no.readonly = TRUE)
  if (is.null(cache$par)) {
    cache$par = cur_par
  }
  cached_par = cache$par

  if (is.null(cache$palette)) {
    cache$palette = palette()
    palette(prettyB_pal())
  }
  changes = vapply(new_par_names,
                   function(i) identical(cur_par[[i]], cached_par[[i]]),
                   logical(1))
  graphics::par(new_par[changes])
}
