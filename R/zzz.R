.onLoad <- function(libname, pkgname) {
  if(requireNamespace("debugme", quietly = TRUE)) {
    debugme::debugme()
  } else {
    if ("crrri" %in% strsplit(Sys.getenv("DEBUGME"), split = ",")[[1]]) {
      packageStartupMessage("It seems you have this package in your DEBUGME variable,",
              "but you have not install the debugme package yet.\n",
              "You need to install it to the the log messages.")
    }
  }
}
