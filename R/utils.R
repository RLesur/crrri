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

build_url <- function(host = "localhost", port = 9222, secure = FALSE) {
  paste0("http", if(isTRUE(secure)) "s", "://", host, ":", port)
}

as_predicate <- function(fun) {
  fun <- rlang::as_function(fun)
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
