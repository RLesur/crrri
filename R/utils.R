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

build_http_url <- function(host, port, secure, path = NULL, query = NULL) {
  scheme <- if(isTRUE(secure)) "https" else "http"
  httr::modify_url("", scheme = scheme, hostname = host, port = port, path = path, query = query)
}

new_target <- function(host = NULL, port = NULL, secure, url = NULL) {
  req <- build_http_url(host, port, secure, path = "/json/new", query = url)
  jsonlite::read_json(req)
}

parse_ws_url <- function(ws_url) {
  # NOTE: ws_url must be a character scalar
  ws_url <- httr::parse_url(ws_url)
  # ws_url scheme must be ws or wss:
  if(!identical(ws_url$scheme, "ws") && !identical(ws_url, "wss")) {
    return(NULL)
  }
  # ws_url must contain a hostname:
  if(is.null(ws_url$hostname)) {
    return(NULL)
  }
  # ws_url must contain a port:
  if(is.null(ws_url$port)) {
    return(NULL)
  }
  # ws_url path must be of the form devtools/page/xxxx or devtools/browser/xxx-yyy
  path <- strsplit(ws_url$path, "/")[[1]]
  if(length(path) != 3L) {
    return(NULL)
  }
  if(!identical(path[1:2], c("devtools", "page")) &&
     !identical(path[1:2], c("devtools", "browser"))
  ) {
    return(NULL)
  }

  structure(
    list(
      host = ws_url$hostname,
      port = ws_url$port,
      secure = identical(ws_url$scheme, "wss"),
      type = path[2],
      id = path[3]
    ),
    class = "cdp_ws_url"
  )
}

build_ws_url <- function(ws_url) {
  stopifnot(inherits(ws_url, "cdp_ws_url"))
  scheme <- if(ws_url$secure) "wss" else "ws"
  path <- c("devtools", ws_url$type, ws_url$id)
  httr::modify_url(
    "",
    scheme = scheme,
    hostname = ws_url$host,
    port = ws_url$port,
    path = path
  )
}

# miscellaneous -----------------------------------------------------------

stop_or_reject <- function(message, async = FALSE) {
  err <- simpleError(message)
  if(isTRUE(async)) {
    return(promises::promise_reject(err))
  }
  stop(err)
}
