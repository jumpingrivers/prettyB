cache = new.env()
theme_set("expand")

.onLoad = function(libname, pkgname){
  ## XXX: Don't like this. Should cache
  set_palette(1)
}

.onUnload = function(libpath) {
#  par(cache$op)
}
