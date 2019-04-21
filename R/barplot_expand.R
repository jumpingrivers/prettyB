# barplot_expand = function(height, ...) {
#   ## Set up par
#   op = set_par_expand()
#   on.exit(graphics::par(op))
#
#
#   if(is.matrix(height)) {
#     col = 1:NROW(height)
#   } else {
#     col = 1
#   }
#
#   new_args = list(border=NA, col=col) # specify defaults here
#   old_args = list(...)
#   new_args[names(old_args)] = old_args
#
#   res = do.call(graphics::barplot.default, c(list(substitute(height)), new_args))
#   abline(0,0)
#   grid(NA, NULL, lwd=1, lty=1, col="white")
#   invisible(res)
# }
