set_par = function(new_par) {
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

set_par_expand = function() {
  par_exp = list(mar = c(3, 3, 2, 1),
                 mgp = c(2, 0.4, 0),
                 tck = -.01,
                 cex.axis = 0.9, las = 1)
  set_par(par_exp)
}


set_par_minimal = function() {
  par_min = list(mar = c(3, 3, 2, 1), mgp = c(2, 0.4, 0), tck = -.01,
                 cex.axis = 0.9, las = 1,
                 xaxs = "i", yaxs = "i",
                 col.lab = "grey50",
                 col.main = "grey20",
                 pch = 21, col = 1,
                 lwd = 1.5)
  set_par(par_min)
}
