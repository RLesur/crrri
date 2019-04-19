#' @include utils.R
#' @include CDP.R
NULL

#' @export
CDPRemote <- R6::R6Class(
  "CDPRemote",
  public = list(
    initialize = function(
      host = "localhost", debug_port = 9222, secure = FALSE, local = FALSE,
      retry_delay = 0.2, max_attempts = 15L
    ) {
      private$.port <- debug_port
      private$.secure <- secure
      private$.local_protocol <- local
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
    },
    connect = function() {
      if(!private$.reachable) stop("Cannot access to remote host.")
      client <- CDP(host = private$.host,
                    port = private$.port,
                    secure = private$.secure,
                    autoConnect = TRUE,
                    local = private$.local_protocol
      )
      private$.clients <- c(private$.clients, list(client))
      client
    },
    listConnections = function() {
      private$.clients
    },
    closeConnections = function() {
      lapply(private$.clients, function(client) client$disconnect())
    }
  ),
  private = list(
    .host = NULL,
    .port = NULL,
    .secure = FALSE,
    .local_protocol = FALSE,
    .reachable = TRUE,
    .clients = list(),
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

