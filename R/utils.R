is_scalar_character <- function(x) {
  rlang::is_scalar_character(x)
}

assertthat::on_failure(is_scalar_character) <- function(call, env) {
  paste0(deparse(call$x), " is not an character scalar (a length one character vector).")
}

is_scalar_integer <- function(x) {
  rlang::is_scalar_integer(x)
}

assertthat::on_failure(is_scalar_integer) <- function(call, env) {
  paste0(deparse(call$x), " is not an integer scalar (a length one integer vector).")
}

is_user_port <- function(x) {
  x >= 1024 && x <= 49151
}

assertthat::on_failure(is_user_port) <- function(call, env) {
  paste0(deparse(call$x), " is not an allowed port number (it must be in the range 1024-49151).")
}

is_available_port <- function(x) {
  tryCatch({
    srv <- httpuv::startServer("127.0.0.1", x, list())
    on.exit(srv$stop())
    TRUE
    },
    error = function(e) FALSE
  )
}

assertthat::on_failure(is_available_port) <- function(call, env) {
  paste0("Port ", deparse(call$x), " already in use. Maybe is headless Chrome already running?")
}

build_url <- function(host = "localhost", port = 9222, secure = FALSE) {
  paste0("http", if(isTRUE(secure)) "s", "://", host, ":", port)
}
