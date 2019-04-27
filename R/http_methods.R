#' @include utils.R
#' @importFrom assertthat assert_that is.scalar
NULL

#' Chrome Debugging Protocol HTTP methods
#'
#' @param host Character scalar, the host name of the application.
#' @param port The remote debugging port (a numeric or a character scalar).
#' @param secure A logical indicating whether a secure protocol shall be used.
#' @param local Logical scalar, indicating whether the local version of the
#'     protocol (embedded in `crrri`) must be used or the protocol must be
#'     fetched _remotely_.
#' @name http-methods
#' @examples
#' \donttest{
#' # fetch the local protocol
#' protocol <- fetch_protocol(local = TRUE)
#'
#' # fetch the protocol of a remote application
#' remote <- Chrome$new()
#' protocol <- fetch_protocol()
#' remote$close()
#' }
NULL

#' @keywords internal
#' @rdname http-methods
#' @return A list.
#' @export
fetch_protocol <- function(host = "localhost", port = 9222, secure = FALSE, local = FALSE) {
  # if the local protocol is fetched, return early
  if(isTRUE(local)) {
    return(read_local_protocol())
  }

  # check arguments
  assert_that(is_scalar_character(host))
  assert_that(is.scalar(port))
  if(!is.number(port) && !is_scalar_character(port)) {
    stop("port must be a character or a numeric scalar.")
  }

  # build url
  url <- build_http_url(host = host, port = port, secure = secure, path = c("json", "protocol"))

  # fetch the protocol
  from_json(url)
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
