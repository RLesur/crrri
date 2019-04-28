#' @include utils.R
#' @importFrom assertthat assert_that is.scalar
NULL

#' Chrome Debugging Protocol HTTP methods
#'
#' When Chromium/Chrome is started in debugging mode, several HTTP endpoints
#' are available. Using these endpoint, one can retrieve information from
#' Chromium/Chrome or send commands, see
#' <https://chromedevtools.github.io/devtools-protocol/#endpoints>.
#'
#' @param host Character scalar, the host name of the application.
#' @param port The remote debugging port (a numeric or a character scalar).
#' @param secure A logical indicating whether a secure protocol shall be used.
#' @param local Logical scalar, indicating whether the local version of the
#'     protocol (embedded in `crrri`) must be used or the protocol must be
#'     fetched _remotely_.
#' @param url URL to open in a new tab.
#' @param target_id Target (or tab) identifier.
#' @return `fetch_version()`, `list_targets()`, `fetch_protocols()` and
#'   `new_tab()` return a list. `activate_target()` and `close_target()` returns
#'    a logical: `TRUE` is returned when the command succeeds, `FALSE` is
#'    returned if a wrong `target_id` is provided.
#' @name http-methods
#' @keywords internal
#' @examples
#' \donttest{
#' chrome <- Chrome$new()
#'
#' fetch_version()
#' # fetch the Chromium/Chrome protocol
#' protocol <- fetch_protocol()
#'
#' # get the list of opened tabs
#' list_targets()
#' # open an url in a new tab
#' new_target <- new_tab(url = "http://r-project.org")
#' # the new tab is referenced in the list of opened tabs
#' list_targets()
#' # inspect a target in a web browser
#' if(interactive()) inspect_target(target_id = new_target$id)
#' # close the previous created tab
#' close_target(target_id = new_target$id)
#'
#' chrome$close()
#' }
NULL

#' @rdname http-methods
#' @export
fetch_version <- function(host = "localhost", port = 9222, secure = FALSE) {
  fetch_json(host, port, secure, "version")
}

#' @rdname http-methods
#' @export
list_targets <- function(host = "localhost", port = 9222, secure = FALSE) {
  fetch_json(host, port, secure, "list")
}

#' @rdname http-methods
#' @export
fetch_protocol <- function(host = "localhost", port = 9222, secure = FALSE, local = FALSE) {
  # if the local protocol is fetched, return early
  if(isTRUE(local)) {
    return(read_local_protocol())
  }
  fetch_json(host, port, secure, "protocol")
}

#' @rdname http-methods
#' @export
new_tab <- function(host = "localhost", port = 9222, secure = FALSE, url = NULL) {
  if(!is.null(url)) {
    assert_that(is_scalar_character(url))
  }
  fetch_json(host, port, secure, "new", url)
}

#' @rdname http-methods
#' @export
activate_target <- function(
  host = "localhost", port = 9222, secure = FALSE, target_id
) {
  target_method(host, port, secure, target_id, "activate")
}

#' @rdname http-methods
#' @export
close_target <- function(
  host = "localhost", port = 9222, secure = FALSE, target_id
) {
  target_method(host, port, secure, target_id, "close")
}

#' @rdname http-methods
#' @export
inspect_target <- function(
  host = "localhost", port = 9222, secure = FALSE, target_id
) {
  assert_that(is_scalar_character(target_id))
  targets <- list_targets(host, port, secure)
  ids <- purrr::map_chr(targets, "id")
  index <- purrr::detect_index(ids, ~ identical(.x, target_id))
  if(index == 0) {
    stop("Wrong target_id.")
  }
  path <- purrr::pluck(targets, index, "devtoolsFrontendUrl")
  url <- build_http_url(host, port, secure, path)
  browse_url(url)
}

fetch_json <- function(host, port, secure, method, query = NULL) {
  check_host_port_args(host, port)
  url <- build_http_url(host, port, secure, path = c("json", method), query)
  from_json(url)
}

target_method <- function(host, port, secure, target_id, method) {
  check_host_port_args(host, port)
  assert_that(is_scalar_character(target_id))
  url <- build_http_url(host, port, secure, path = c("json", method, target_id))
  res <- httr::GET(url, httr::use_proxy(""))
  !httr::http_error(res)
}

check_host_port_args <- function(host, port) {
  assert_that(is_scalar_character(host))
  assert_that(is.scalar(port))
  if(!is.number(port) && !is_scalar_character(port)) {
    stop("port must be a character or a numeric scalar.")
  }
}

from_json <- function(path) {
  jsonlite::fromJSON(
    path,
    simplifyVector = TRUE,
    simplifyDataFrame = FALSE,
    simplifyMatrix = FALSE
  )
}

read_local_protocol <- function() {
  js_protocol <- from_json(local_protocol_file("js"))
  browser_protocol <- from_json(local_protocol_file("browser"))
  browser_protocol$domains <- c(browser_protocol$domains, js_protocol$domains)
  browser_protocol
}

local_protocol_file <- function(file = c("js", "browser")) {
  file <- match.arg(file)
  system.file("protocol", paste0(file, "_protocol.json"), package = "crrri", mustWork = TRUE)
}

browse_url <- function(url) {
  localhost <- is_localhost(url)
  viewer <- getOption("viewer")
  if (!is.null(viewer) && localhost){
    viewer(url)
  }
  else {
    utils::browseURL(url)
  }
}

is_localhost <- function(url) {
  host <- httr::parse_url(url)$hostname
  if(is.null(host)) {
    return(FALSE)
  }
  host %in% c("localhost", "127.0.0.1")
}
