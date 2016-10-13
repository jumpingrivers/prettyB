cache = new.env()
cache$par = list()
theme_set("expand")

.onLoad = function(libname, pkgname){
  set_palette(1)
}

.onUnload = function(libpath) {
  par(cache$op)
}
