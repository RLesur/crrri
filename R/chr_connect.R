#' Connect R to a new Chrome instance
#'
#' @param bin Command or path to the Chrome exe.
#' @param debug_port Port of the Chrome instance.
#' @param extra_args Extra arguments passed to command line.
#' @param headless Is Chrome launch in headless mode?
#' @param work_dir Chrome working directory.
#'
#' @return An asynchronous result object that can be passed to any command or event listeners.
#'
#' @export
#'
#' @examples
chr_connect <- function(
  bin = "google-chrome", debug_port = 9222, extra_args = NULL, headless = TRUE,
  work_dir = "remote-profile"
) { promises::promise(function(resolve, reject) {

  chr_process <-  tryCatch(chr_init(debug_port, bin, extra_args, headless, work_dir),
                           error = function(e) reject(e))
  chr_endpoint <- tryCatch(ws_addr(debug_port),
                           error = function(e) {
                             cat("Cannot find the websocket entrypoint of Chrome headless.\n")
                             reject(e)
                             chr_kill(chr_process, work_dir)
                           }
  )

  ws <- websocket::WebSocket$new(chr_endpoint, autoConnect = FALSE)

  cnx <- list2env(
    list(
      ws = ws,
      remote_protocol = jsonlite::read_json(sprintf("http://localhost:%s/json/protocol", debug_port)),
      chr_process = chr_process,
      work_dir = work_dir
    ),
    parent = emptyenv()
  )

  ws$onOpen(function(event) {
    cat("R succesfully connected to headless Chrome through DevTools Protocol.\n")
    resolve(list(cnx = cnx, result = NULL))
  })

  ws$onMessage(function(event) {
      data <- jsonlite::fromJSON(event$data)
      cat("Got message from Chrome:", event$data, "\n")
    })

  ws$onClose(function(event) {
    cat("R disconnected from headless Chrome with code ", event$code,
        " and reason ", event$reason, ".\n", sep = "")
  })

  ws$onError(function(event) {
    msg <- paste0("Client failed to connect: ", event$message, ".")
    cat(msg, "\n", sep = "")
    reject(msg)
    chr_kill(chr_process, work_dir)
  })

  ws$connect()
})}

#' Disconnect R from a Chrome instance and close it
#'
#' @param promise A previous asynchronous result.
#'
#' @return `TRUE` invisibly.
#' @export
#'
#' @examples
chr_disconnect <- function(promise) {
  promises::then(promise, onFulfilled = function(value) {
    value$cnx$ws$close()
    chr_kill(value$cnx$chr_process, value$cnx$work_dir)
  })
}

# From milesmcbain/chradle
chr_init <- function(
  debug_port = 9222, bin = "google-chrome", extra_args = NULL, headless = TRUE,
  work_dir = "remote-profile"
) {

  if (.Platform$OS.type == "windows")
    extra_args <- c(extra_args, "--disable-gpu", if (headless) "--no-sandbox")

  if (nzchar(Sys.getenv("http_proxy")))
    extra_args <- c(
      extra_args,
      paste("--proxy-server", Sys.getenv("http_proxy"), sep = "="),
      "--proxy-bypass-list=localhost"
    )

  chr_process <- processx::process$new(
    bin,
    c(if (headless) "--headless" else "--new-window",
      paste0("--user-data-dir=", work_dir),
      "--no-first-run",
      extra_args,
      paste0("--remote-debugging-port=", debug_port)
    )
  )

  reg.finalizer(chr_process, function(process) chr_clean(work_dir), onexit = TRUE)

  debugger_200_ok(debug_port)
  cat("Chrome succesfully launched", if (headless) "in headless mode", "\n")
  chr_process
}

chr_kill <- function(chr_process, work_dir) {
  cat("Closing headless Chrome...\n")
  chr_process$kill()
  cat("...headless Chrome closed.\n")
  chr_clean(work_dir)
}

debugger_200_ok <- function(port, retry_delay = 0.2, max_attempts = 15, attempt = 1) {
  if (max_attempts <= attempt) {
    stop(paste0("Reached max attempts (", max_attempts,
                ") without HTTP 200 response from debugger on http://localhost:", port
    ))
  }

  url <- paste0("http://localhost:", port)
  check_url <- purrr::safely(httr::GET, otherwise = NA)
  response <- check_url(url, httr::use_proxy(""))

  if (is.na(response$result) || response$result$status_code != 200) {
    Sys.sleep(retry_delay)
    Recall(port, retry_delay, max_attempts, attempt = attempt + 1)
  } else {
    TRUE
  }
}

# Adapted from milesmcbain/chradle
ws_addr <- function(debug_port) {
  open_debuggers <-
    jsonlite::read_json(sprintf("http://localhost:%s/json", debug_port), simplifyVector = TRUE)
  open_debuggers$webSocketDebuggerUrl[open_debuggers$type == "page"]
}

# Adapted from milesmcbain/chradle
chr_clean <- function(work_dir) {
  if (dir.exists(work_dir)) {
    cat("Cleaning headless Chrome working directory.\n")
    processx::process$new("rm", c("-rf", work_dir))
  }
}
