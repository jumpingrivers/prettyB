#' @importFrom graphics par
#' @export
par = function(..., no.readonly = FALSE) {
  new_args = list(...)
  ## Keep track of changes in par
  cache$par[names(new_args)] = new_args
  graphics::par(..., no.readonly = no.readonly)
}


set_par_expand = function() {

  par_exp = list(mar = c(3, 3, 2, 1), mgp = c(2, 0.4, 0), tck = -.01,
    cex.axis = 0.9, las = 1)
  cur_par = cache$par
  par_exp[names(cur_par)] = cur_par
  graphics::par(par_exp)
}


set_par_minimal = function() {

  par_min = list(mar = c(3, 3, 2, 1), mgp = c(2, 0.4, 0), tck = -.01,
                 cex.axis = 0.9, las = 1, xaxs='i',yaxs='i', col.lab="grey50")
  cur_par = cache$par
  par_min[names(cur_par)] = cur_par
  graphics::par(par_min)
}
