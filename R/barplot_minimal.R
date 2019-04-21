# barplot_minimal = function(height, ...) {
#
#   ## Set par
#   op = set_par_minimal()
#   on.exit(graphics::par(op))
#
#   if(is.matrix(height)) {
#     col = 1:NROW(height)
#   } else {
#     col = 1
#   }
#   new_args = list(border=NA, col=col, axes=FALSE) # specify defaults here
#   old_args = list(...)
#   new_args[names(old_args)] = old_args
#   new_args$main = NULL
#
#   res = do.call(graphics::barplot.default, c(list(substitute(height)), new_args))
#   abline(0,0)
#   grid(NA, NULL, lwd=1, lty=1, col="#ffffff")
#   if(is.matrix(height)) {
#     heights = c(0, colSums(height))
#   } else {
#     heights = c(0, height)
#   }
#   ticks_y = axTicks(2)
#   axis(2, ticks_y, ticks_y, tick = FALSE, las = 1)
#   abline(h = ticks_y, col = "white", lty = 1)
#   if(!is.null(old_args$main)) {
#     title(old_args$main, adj=1,
#           cex.main=1.1, font.main=2, col.main="black")
#   }
#
#   invisible(res)
# }
