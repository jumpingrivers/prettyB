hist_minimal = function(x, ...) {
  ## Set up par
  op = set_par_minimal()
  on.exit(graphics::par(op))

  ## Grab old_args
  old_args = list(...)


  ## Now args
  new_args = list(breaks = "Freedman-Diaconis", col=1)
  new_args[names(old_args)] = old_args

  hist_out = do.call(graphics::hist.default, c(list(substitute(x)), new_args, list(plot=TRUE)))

  if(is.null(old_args$freq) || isTRUE(old_args$freq)) {
    ticks_y = pretty(hist_out$counts)
  } else {
    ticks_y = pretty(hist_out$counts/sum(hist_out$counts))
  }
  new_args$ylim = range(ticks_y)
  new_args$axes = FALSE
  new_args$main = ""

  z = do.call(graphics::hist.default, c(list(substitute(x)), new_args))


  axis(2, ticks_y, ticks_y, tick = FALSE, las = 1)
  #abline(h = ticks_y, col = "white")
  abline(0,0)
  grid(NA, NULL, lwd=1, lty=1, col="#ffffff")

  # axis(1,ticks_x, ticks_x,
  #      tick = TRUE,
  #      lwd = 0,
  #      lwd.ticks = 1)
  #
  main = old_args$main
  if(is.null(old_args$main)) {
    main = paste("Histogram of", z$xname)
  }
  title(main, adj=1,
           cex.main=1.1, font.main=2, col.main="black")

  invisible(z)
}
