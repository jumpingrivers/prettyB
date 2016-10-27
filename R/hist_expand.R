hist_expand = function(x, ...) {
  ## Set up par
  op = set_par_expand()
  on.exit(graphics::par(op))

  ## Now args
  new_args = list(breaks = "Freedman-Diaconis", main = "")
  old_args = list(...)
  new_args[names(old_args)] = old_args
  hist_out = do.call(graphics::hist.default, c(list(substitute(x)), new_args, list(plot=TRUE)))

  if(is.null(old_args$freq) || isTRUE(old_args$freq)) {
    ticks_y = pretty(hist_out$counts)
  } else {
    ticks_y = pretty(hist_out$counts/sum(hist_out$counts))
  }
  new_args$ylim = range(ticks_y)
  ticks_x = pretty(hist_out$breaks)
  new_args$xlim = range(ticks_x)



  z = do.call(graphics::hist.default, c(list(substitute(x)), new_args))


  main = old_args$main
  if(is.null(old_args$main)) {
    main = paste("Histogram of", z$xname)
  }
  title(main, adj=1,
        cex.main=1.1, font.main=2, col.main="black")
  invisible(z)
}

