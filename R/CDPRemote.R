#' @include utils.R
#' @include CDPSession.R
#' @importFrom assertthat assert_that is.scalar is.number
NULL

#' Declare a remote application implementing the Chrome Debugging Protocol
#'
#' This class aims to declare an application implementing the Chrome Debugging
#' Protocol. It possesses methods to manage connections.
#'
#' @section Usage:
#' ```
#' remote <- CDPRemote$new(host = "localhost", debug_port = 9222, secure = FALSE,
#'                         local = FALSE, retry_delay = 0.2, max_attempts = 15L)
#'
#' remote$connect(callback = NULL)
#' remote$listConnections()
#' remote$closeConnections()
#' remote$version()
#' remote$user_agent
#' ```
#'
#' @section Arguments:
#' * `remote`: an object representing a remote application implementing the
#'     Chrome Debugging Protocol.
#' * `host`: Character scalar, the host name of the application.
#' * `debug_port`: Numeric scalar, the  remote debugging port.
#' * `secure`: Logical scalar, indicating whether the https/wss protocols
#'     shall be used for connecting to the remote application.
#' * `local`: Logical scalar, indicating whether the local version of the
#'     protocol (embedded in `crrri`) must be used or the protocol must be
#'     fetched _remotely_.
#' * `retry_delay`: Number, delay in seconds between two successive tries to
#'     connect to the remote application.
#' * `max_attempts`: Logical scalar, number of tries to connect to headless
#'     Chromium/Chrome.
#' * `callback`: Function with one argument, executed when the R session is
#'     connected to the remote application. The connection object is passed
#'     to this function.
#'
#' @section Details:
#' `$new()` declares a new remote application.
#'
#' `$connect(callback = NULL)` connects the R session to the remote application.
#' The returned value depends on the value of the `callback` argument. When
#' `callback` is a function, the returned value is a connection object. When
#' `callback` is `NULL` the returned value is a promise which becomes fulfilled
#' once R is connected to the remote application. Once fulfilled, the value of
#' this promise is the connection object.
#'
#' `$listConnections()` returns a list of the connection objects succesfully
#' created using the `$connect()` method.
#'
#' `$closeConnections()` closes all the connections created using the
#' `$connect()` method.
#'
#' `$version()` executes the DevTools `Version` method. It returns a list of
#' informations available at `http://<host>:<debug_port>/json/version`.
#'
#' `$user_agent` returns a character scalar with the User Agent of the
#' remote application.
#'
#' @name CDPRemote
#' @examples
#' \dontrun{
#' # Assuming that an application is already running at http://localhost:9222
#' # For instance, you can execute:
#' # chrome <- Chrome$new()
#'
#' remote <- CDPRemote$new()
#'
#' remote$connect() %...>% (function(client) {
#'   Page <- client$Page
#'   Runtime <- client$Runtime
#'
#'   Page$enable() %...>% {
#'     Page$navigate(url = 'http://r-project.org')
#'   } %...>% {
#'     Page$loadEventFired()
#'   } %...>% {
#'     Runtime$evaluate(
#'       expression = 'document.documentElement.outerHTML'
#'     )
#'   } %...>% (function(result) {
#'     cat(result$result$value, "\n")
#'   }) %...!% {
#'     cat("Error:", .$message, "\n")
#'   } %>%
#'   promises::finally(~ client$disconnect())
#' }) %...!% {
#'   cat("Error:", .$message, "\n")
#' }
#' }
#'
NULL

#' @export
CDPRemote <- R6::R6Class(
  "CDPRemote",
  public = list(
    initialize = function(
      host = "localhost", debug_port = 9222, secure = FALSE, local = FALSE,
      retry_delay = 0.2, max_attempts = 15L
    ) {
      assert_that(is_scalar_character(host))
      assert_that(is.number(debug_port))
      assert_that(is.scalar(secure), is.logical(secure))
      assert_that(is.scalar(local), is.logical(local))
      assert_that(is.number(retry_delay))
      assert_that(is_scalar_integer(max_attempts))

      private$.port <- debug_port
      private$.secure <- secure
      private$.local_protocol <- isTRUE(local)
      private$.retry_delay <- retry_delay
      private$.max_attempts <- max_attempts
      remote_reachable <- is_remote_reachable(host, debug_port, retry_delay, max_attempts)
      if(!remote_reachable && host == "localhost") {
        host <- "127.0.0.1"
        remote_reachable <- is_remote_reachable(host, debug_port, retry_delay, max_attempts)
      }
      if(!remote_reachable) {
        warning("Cannot access to remote host...")
        private$.reachable <- FALSE
      }
      private$.host <- host
      self$version() # run once to store version
    },
    connect = function(callback = NULL) {
      if(!is.null(callback)) {
        callback <- rlang::as_function(callback)
        assertthat::assert_that(
          length(rlang::fn_fmls(callback)) > 0,
          msg = "The callback function must have one argument."
        )
      }
      private$.check_remote()
      if(!private$.reachable) stop("Cannot access to remote host.")
      con <- CDPSession(
        host = private$.host,
        port = private$.port,
        secure = private$.secure,
        local = private$.local_protocol,
        callback = callback
      )
      if(promises::is.promise(con)) {
        promises::then(
          con,
          onFulfilled = function(value) {
            private$.clients <- c(private$.clients, list(value))
          },
          onRejected = function(err) {
            warning(err$message, call. = FALSE, immediate. = TRUE)
          }
        )
      } else {
        private$.clients <- c(private$.clients, list(con))
      }
      con
    },
    listConnections = function() {
      private$.clients
    },
    closeConnections = function() {
      lapply(private$.clients, function(client) client$disconnect())
      private$.clients <- list()
    },
    version = function() {
      private$.check_remote()
      if(private$.reachable) {
        # if remote is opened, update the private field .version
        url <- paste0(build_url(private$.host, private$.port, private$.secure), "/json/version")
        private$.version <- jsonlite::read_json(url)
      }
      private$.version
    },
    print = function() {
      version <- self$version()
      cat(sep = "",
          "<", version$Browser, ">\n",
          '  User Agent:\n',
          '    "', version$`User-Agent`, '"\n'
      )
    }
  ),
  active = list(
    user_agent = function() {
      self$version()$`User-Agent`
    }
  ),
  private = list(
    .host = NULL,
    .port = NULL,
    .secure = FALSE,
    .local_protocol = FALSE,
    .retry_delay = 0.2,
    .max_attempts = 15L,
    .reachable = TRUE,
    .version = list(),
    .clients = list(),
    .check_remote = function() {
      if(private$.reachable) {
        private$.reachable <- is_remote_reachable(
          private$.host,
          private$.port,
          private$.retry_delay,
          private$.max_attempts
        )
      }
    },
    finalize = function() {
      self$closeConnections()
    }
  )
)

# helper to test chrome connexion -----------------------------------------
is_remote_reachable <- function(host, port, retry_delay = 0.2, max_attempts = 15L) {
  url <- build_url(host, port)
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

