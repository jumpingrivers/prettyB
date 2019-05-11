get_name_axis = function(at, lim, boxwex, box_out, log) {
  box_padding = max(0, 1 - boxwex) / 2
  if (!is.null(at)) {
    ticks = at
    if (!is.null(lim)) {
      lim = c(1 - boxwex / 2 - box_padding,
                    length(at) + boxwex / 2 + box_padding)
    }
  } else if (is.null(lim)) {
    ticks = seq_len(length(box_out$names))
    lim = c(1 - boxwex / 2 - box_padding,
                  length(box_out$names) + boxwex / 2 + box_padding)
  } else {
    ticks = pretty(lim)
    lim = range(ticks)
  }
 list(lim = lim, ticks = ticks)
}

get_number_axis = function(lim, box_out, log) {
  if (!is_y(log)) {
    if (is.null(lim)) {
      y_tmp = range(box_out$stats)
      ticks = pretty(y_tmp)
      lim = extend_axis(range(ticks))
    } else {
      ticks = pretty(lim)
      lim = range(ticks)
    }
  }
  list(lim = lim, ticks = ticks)
}
