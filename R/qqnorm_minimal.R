# qqnorm_minimal = function(y, ...) {
#
#   ## Set up par
#   op = set_par_minimal()
#   on.exit(graphics::par(op))
#
#   new_args = list(pch = 21, bg = 1, axes = FALSE, frame = FALSE)
#   old_args = list(...)
#   new_args[names(old_args)] = old_args
#
#
#   ylim = old_args$ylim
#   ## Now check for log scales
#   if(is.null(ylim) &&  is_y(old_args$log)) {
#     ylim = range(y) *1.05
#     xlim = ylim
#   }
#
#   if(is.null(ylim)) {
#     ticks_y = pretty(y)
#     ylim = range(ticks_y)*1.05
#     xlim = ylim
#   } else {
#     ticks_y = pretty(c(ylim, y))
#   }
#
#   new_args$ylim = ylim
#   new_args$xlim = xlim
#
#   ## Need to remove main from new_args & pass it to do.call
#   new_args$main = NULL
#   res = do.call(stats_qqnorm_default, c(list(substitute(y), main=NULL), new_args))
#   if(is_y(old_args$log)){
#     ticks_y = axTicks(2)
#   }
#
#   ## Check for plot.it
#   # Add axis
#   axis(2, tick = FALSE, las = 1)
#   abline(h = ticks_y, col = "grey90", lty = 2)
#   axis(1, tick = TRUE, lwd = 0, lwd.ticks = 1)
#
#   ## Sneaky <- assignment
#   if(is.null(title_text <- old_args$main)) {
#     title_text = "Normal Q-Q Plot"
#   }
#   title(title_text, adj=1,
#         cex.main=1, font.main=2, col.main="black")
#   invisible(res)
#
#
# }
