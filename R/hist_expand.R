# hist_expand = function(x, ...) {
#   ## Set up par
#   op = set_par_expand()
#   on.exit(graphics::par(op))
#
#   ## Now args
#   new_args = list(breaks = "Freedman-Diaconis", main = "")
#   old_args = list(...)
#   new_args[names(old_args)] = old_args
#   hist_out = do.call(graphics::hist.default, c(list(substitute(x)), new_args, list(plot=FALSE)))
#
#   if(is.null(old_args$freq) || isTRUE(old_args$freq)) {
#     ticks_y = pretty(c(hist_out$counts, old_args$ylim, 0))
#   } else {
#     ticks_y = pretty(hist_out$counts/sum(hist_out$counts, old_args$ylim, 0))
#   }
#   new_args$ylim = range(ticks_y)
#   ticks_x = pretty(c(hist_out$breaks, old_args$xlim))
#   new_args$xlim = range(ticks_x)
#
#   z = do.call(graphics::hist.default, c(list(substitute(x)), new_args))
#
#   title(old_args$main, adj=1,
#         cex.main=1.1, font.main=2, col.main="black")
#   invisible(z)
# }
#
