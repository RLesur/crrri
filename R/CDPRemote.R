#' @include utils.R
#' @include CDPSession.R
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
    connect = function() {
      private$.check_remote()
      if(!private$.reachable) stop("Cannot access to remote host.")
      client <- CDPSession(
        host = private$.host,
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

