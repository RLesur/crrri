# assertthat helpers ------------------------------------------------------

is_scalar_character <- function(x) {
  rlang::is_scalar_character(x)
}

assertthat::on_failure(is_scalar_character) <- function(call, env) {
  paste0(deparse(call$x), " is not a character scalar (a length one character vector).")
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

# http helpers ------------------------------------------------------------

build_http_url <- function(host = NULL, port = NULL, secure, path = NULL) {
  scheme <- if(isTRUE(secure)) "https" else "http"
  httr::modify_url("", scheme = scheme, hostname = host, port = port, path = path)
}

is_remote_reachable <- function(host, port, secure, retry_delay = 0.2, max_attempts = 15L) {
  url <- build_http_url(host = host, port = port, secure = secure)
  remote_reached <- function(url) {
    check_url <- purrr::safely(httr::GET, otherwise = list())
    response <- check_url(url, httr::use_proxy(""))
    isTRUE(response$result$status_code == 200)
  }

  succeeded <- FALSE
  "!DEBUG Trying to find `url`"
  for (i in 1:max_attempts) {
    "!DEBUG attempt `i`..."
    succeeded <- remote_reached(url)
    if (isTRUE(succeeded)) break
    Sys.sleep(retry_delay)
  }

  "!DEBUG `if(succeeded) paste(url, 'found') else paste('...cannot find', url)`"
  succeeded
}

# miscellaneous -----------------------------------------------------------

stop_or_reject <- function(message, async = FALSE) {
  err <- simpleError(message)
  if(isTRUE(async)) {
    return(promises::promise_reject(err))
  }
  stop(err)
}
