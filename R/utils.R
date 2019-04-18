build_url <- function(host = "localhost", port = 9222, secure = FALSE) {
  paste0("http", if(isTRUE(secure)) "s", "://", host, ":", port)
}
