# hist_minimal = function(x, ...) {
#   ## Set up par
#   op = set_par_minimal()
#   on.exit(graphics::par(op))
#
#   ## Grab old_args
#   old_args = list(...)
#
#   new_args = list(breaks = "Freedman-Diaconis", col=1, border="white", plot=FALSE)
#   new_args[names(old_args)] = old_args
#   ## Now args
#   hist_out = suppressWarnings(
#     do.call(graphics::hist.default, c(list(substitute(x)), new_args))
#   )
#   new_args$plot = old_args$plot
#
#   if(is.null(old_args$freq) || isTRUE(old_args$freq)) {
#     ticks_y = pretty(c(hist_out$counts, old_args$ylim, 0))
#   } else {
#     ticks_y = pretty(c(hist_out$counts/sum(hist_out$counts, old_args$ylim, 0)))
#   }
#
#   if(is.null(old_args$ylim)) {
#     new_args$ylim = range(ticks_y)
#   }
#
#   ticks_x = pretty(c(hist_out$breaks, old_args$xlim))
#   if(is.null(old_args$xlim)) {
#     new_args$xlim = range(ticks_x)
#   }
#   new_args$axes = FALSE
#
#   ## Don't display title - use title()
#   new_args$main = " "
#   z = do.call(graphics::hist.default, c(list(substitute(x)), new_args))
#
#   axis(2, ticks_y, ticks_y, tick = FALSE, las = 1)
#   abline(0,0)
#   grid(NA, NULL, lwd=1, lty=1, col="#ffffff")
#   axis(1,ticks_x, ticks_x,
#        tick = TRUE,
#        lwd = 0,
#        lwd.ticks = 1)
#
#   title(old_args$main, adj=1,
#            cex.main=1.1, font.main=2, col.main="black")
#
#   invisible(z)
# }
