## nocov start

.onLoad <- function(libname, pkgname) {
  if(requireNamespace("debugme", quietly = TRUE)) debugme::debugme()
}

## nocov end
