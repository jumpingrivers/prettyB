cache = new.env()
current = new.env()

prettyB_pal = function(alpha = 255) {
  c(rgb(85, 130, 169, alpha = alpha, maxColorValue = 255),
    rgb(200, 79, 178, alpha = alpha, maxColorValue = 255),
    rgb(105, 147, 45, alpha = alpha, maxColorValue = 255),
    rgb(204, 74, 83, alpha = alpha, maxColorValue = 255),
    rgb(183, 110, 39, alpha = alpha, maxColorValue = 255),
    rgb(131, 108, 192, alpha = alpha, maxColorValue = 255),
    rgb(63, 142, 96, alpha = alpha, maxColorValue = 255))

}

#' @importFrom grDevices palette rgb
.onLoad = function(libname, pkgname){

  # Cache current values
  cache$palette = NULL
  cache$par = NULL

  cache$first = TRUE

  ## Set values
  #theme_set(theme = "minimal")
}

.onUnload = function(libpath) {
  # if (!is.null(cache$par)) {
  #   par(cache$par)
  # }
  #
  # if (!is.null(cache$palette)) {
  #   palette(cache$palette)
  # }
}
