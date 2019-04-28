#
# qqnorm_expand = function(y, ...) {
#   ## Set up par
#   op = set_par_expand()
#   on.exit(graphics::par(op))
#
#   new_args = list(pch = 21, bg = 1)
#   old_args = list(...)
#   new_args[names(old_args)] = old_args
#   do.call(stats_qqnorm_default, c(list(substitute(y)), new_args))
# }
#
