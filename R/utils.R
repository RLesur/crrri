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

is_function <- function(x) {
  rlang::is_function(x)
}

assertthat::on_failure(is_function) <- function(call, env) {
  paste0(deparse(call$x), "must be a function.")
}

is_single_param_fun <- function(x) {
  assertthat::assert_that(is_function(x))
  length(rlang::fn_fmls(x)) == 1L
}

assertthat::on_failure(is_single_param_fun) <- function(call, env) {
  paste0("Function ", deparse(call$x), " must have one parameter and only one.")
}

check_is_single_param_fun <- function(x) {
  assertthat::assert_that(is_single_param_fun(x))
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

#' create a predicate from various forms
#'
#' @param arg a function, a formula or a value that will be tested as identical
#' @param env see env from `rlang::as_function`
#'
#' @return a function that will apply the predicate and return TRUE or FALSE
#' @noRd
as_predicate <- function(arg, env = rlang::caller_env()) {
  if(rlang::is_formula(arg) || rlang::is_function(arg)) {
    fun <- rlang::as_function(arg, env = env)
  } else {
    fun <- function(x) identical(x, arg)
  }

  function(...) {
    res <- fun(...)
    if(!rlang::is_true(res) && !rlang::is_false(res)) {
      stop("Predicate functions must return a single `TRUE` or `FALSE`.")
    }
    res
  }
}

#' Combine predicates
#'
#' @param list_of_predicates A named list of predicates.
#'
#' @return A function that take a single parameter. The argument of the
#'     returned function is expected to be a named list. The predicates
#'     function are applied to the objects of the result
#' @noRd
combine_predicates <- function(list_of_predicates) {
  if(length(list_of_predicates) == 0) return(function(...) TRUE)
  function(result) {
    # if a name of a predicate is missing in the result object, return FALSE early
    if(length(setdiff(names(list_of_predicates), names(result))) > 0) {
      return(FALSE)
    }
    bool <- purrr::imap_lgl(list_of_predicates, ~ .x(result[[.y]]))
    all(bool)
  }
}


# callbacks wrappers ------------------------------------------------------
dewrap <- function(x, ...) {
  UseMethod("dewrap", x)
}

dewrap.default <- function(x, ...) {
  x
}

dewrap.crrri_callback_wrapper <- function(x, ...) {
  attr(x, "callback", exact = TRUE)
}

format.crrri_callback_wrapper <- function(x, ...) {
  format_object <- paste(collapse = "\n", format(dewrap(x)))
  paste("=== wrapper over function ===", format_object, sep = "\n")
}

print.crrri_callback_wrapper <- function(x, ...) {
  cat(format(x), "\n")
}

new_callback_wrapper <- function(wrapper_fn, callback) {
  stopifnot(rlang::is_function(wrapper_fn), rlang::is_function(callback))
  attr(wrapper_fn, "callback") <- dewrap(callback)
  if(!inherits(wrapper_fn, "crrri_callback_wrapper")) {
    class(wrapper_fn) <- c("crrri_callback_wrapper", class(wrapper_fn))
  }
  wrapper_fn
}

