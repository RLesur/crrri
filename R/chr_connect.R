#' @include DevToolsConnexion.R
NULL

#' Connect R to a new Chrome instance
#'
#' @param bin Command or path to the Chrome exe.
#' @param debug_port Port of the Chrome instance.
#' @param extra_args Extra arguments passed to command line.
#' @param headless Is Chrome launch in headless mode?
#' @param auto_connect Is the connexion to Chrome launched immediately?
#' @param async Is the returned object a promise?
#'
#' @return A connexion object that is a named list of two elements. The object
#'   has a `result` element that is `NULL` for a new connexion and a `ws`
#'   element that is a WebSocket object.
#'
#' @export
chr_connect <- function(
  bin = Sys.getenv("HEADLESS_CHROME"), debug_port = 9222, extra_args = NULL,
  headless = TRUE, auto_connect = TRUE, async = TRUE
) {

  fails <- FALSE
  work_dir <- chr_new_data_dir()

  # Step 1: launch Chrome
  chr_process <- chr_launch(bin, debug_port, extra_args, headless, work_dir)
  if (is.null(chr_process))
    fails <- TRUE

  # Step 2: check that Chrome is reachable at http://localhost:debug_port
  if (!isTRUE(fails)) {
    chrome_reachable <- is_chrome_reachable(debug_port)
    if (!isTRUE(chrome_reachable))
      fails <- TRUE
  }

  # Step 3: retrieve the websocket address
  if (!isTRUE(fails)) {
    ws_endpoint <- chr_get_ws_addr(debug_port)
    if (is.null(ws_endpoint))
      fails <- TRUE
  }

  # Step 4: configure the websocket connexion
  if (isTRUE(fails)) {
    ws <- NULL
  } else {
    ws <- ws_configure(ws_endpoint, chr_process, work_dir)
    fails <- TRUE
  }

  if (is.null(ws) & !is.null(chr_process)) {
    chr_close(chr_process, work_dir)
  }

  # Step 5: build the result object and open the connexion if relevant
  if (isTRUE(async))
    result <- promises::promise(function(resolve, reject) {
      if (is.null(chr_process)) {
        reject("Failed to launch Chrome.")
        return()
      }
      if (is.null(ws)) {
        reject("Failed to configure the websocket connexion.")
        return()
      }
      ws$onOpen(function(event) {
        resolve(list(ws = ws, result = NULL))
      })
      ws$onError(function(event) {
        msg <- paste0("R failed to connect to Chrome: ", event$message, ".")
        reject(msg)
      })
    })
  else {
    if (is.null(chr_process)) {
      stop("Failed to launch Chrome.")
    }
    if (is.null(ws)) {
      stop("Failed to configure the websocket connexion.")
    }
    result <- ws
  }

  if (isTRUE(auto_connect) & !is.null(ws)) {
    "!DEBUG Connecting R to Chrome..."
    ws$connect()
  }

  return(result)
}

chr_new_data_dir <- function(length = 8, slug = "chrome-data-dir-") {
  user_data_dir <- rappdirs::user_data_dir(appname = "r-crri")
  random_string <- paste(sample(letters, size = length, replace = TRUE), collapse = "")
  normalizePath(file.path(user_data_dir, paste0(slug, random_string)), mustWork = FALSE)
}

#' Disconnect R from a Chrome instance and close it
#'
#' @param promise A previous asynchronous result.
#'
#' @return `TRUE` invisibly.
#' @export
#'
chr_disconnect <- function(promise) {
  promises::then(promise, onFulfilled = function(value) {
    value$ws$close()
  })
}
# Step 1: launch Chrome ---------------------------------------------------
# This function launches a new Chrome processus
# The user has to provide a working directory for Chrome: see the helper function chr_new_data_dir()
# The command can silently fails: in this case, NULL is returned.
chr_launch <- function(
  bin = Sys.getenv("HEADLESS_CHROME"), debug_port = 9222, extra_args = NULL, headless = TRUE, work_dir
) {

  proxy <- get_proxy()
  behind_proxy <- nzchar(proxy)

  if (behind_proxy)
    extra_args <- c(chr_proxy_args(proxy), extra_args)

  if (is_os_type("windows"))
    extra_args <- c(chr_windows_args(headless), extra_args)

  chrome_args <- unique(c(
    chr_default_args(),
    chr_headless_args(headless),
    chr_work_dir_args(work_dir),
    chr_debugging_port_args(debug_port),
    extra_args
  ))

  "!DEBUG Trying to launch Chrome `if (headless) 'in headless mode'` ..."
  chr_process <-
    tryCatch(processx::process$new(bin, chrome_args, echo_cmd = TRUE),
             error = function(e) NULL
    )

  if (!is.null(chr_process)) {
    reg.finalizer(chr_process,
                  function(process) chr_close(process, work_dir),
                  onexit = TRUE
    )
  "!DEBUG Chrome succesfully launched `if (headless) 'in headless mode'`."
  "!DEBUG It should be accessible at http://localhost:`debug_port`"
  } else {
  "!DEBUG Cannot launch Chrome. Please check your system configuration."
  }

  chr_process # NULL if fails
}

get_proxy <- function() {
  # the order of the variables is important
  # we will take the first non empty variable
  env_var <- c("https_proxy", "HTTPS_PROXY", "http_proxy", "HTTP_PROXY")
  values <- Sys.getenv(env_var)
  values <- values[nzchar(values)]
  if (length(values) > 0)
    return(values[1])
  else
    return("")
}

chr_proxy_args <- function(proxy) {
  proxy_arg <- paste("--proxy-server", proxy, sep = "=")

  no_proxy_urls <- get_no_proxy_urls()
  no_proxy_string <- paste(no_proxy_urls, collapse = ";")
  no_proxy_arg <- paste("--proxy-bypass-list", no_proxy_string, sep = "=")

  c(proxy_arg, no_proxy_arg)
}

get_no_proxy_urls <- function() {
  env_var <- Sys.getenv(c("no_proxy", "NO_PROXY"))
  urls <- do.call(c, stringi::stri_split_fixed(env_var, ";"))
  urls <- c(default_no_proxy_urls(), urls)
  unique(urls)
}

default_no_proxy_urls <- function() {
  c("localhost", "127.0.0.1")
}

is_os_type <- function(os) {
  identical(.Platform$OS.type, os)
}

chr_windows_args <- function(headless) {
  c("--disable-gpu", if (headless) "--no-sandbox")
}

chr_headless_args <- function(headless) {
  if (headless)
    c("--headless")
  else
    c("--new-window")
}

chr_default_args <- function() {
  c("--no-first-run")
}

chr_work_dir_args <- function(work_dir) {
  paste("--user-data-dir", work_dir, sep = "=")
}

chr_debugging_port_args <- function(debug_port) {
  paste("--remote-debugging-port", debug_port, sep = "=")
}

# Step 2: check that Chrome is reachable at http://localhost:debug --------
is_chrome_reachable <- function(port, retry_delay = 0.2, max_attempts = 15L) {
  url <- paste0("http://localhost:", port)
  chrome_reached <- function() {
    check_url <- purrr::safely(httr::GET, otherwise = list())
    response <- check_url(url, httr::use_proxy(""))
    isTRUE(response$result$status_code == 200)
  }

  succeeded <- FALSE
  "!DEBUG Trying to find `url`"
  for (i in 1:max_attempts) {
    "!DEBUG attempt `i`..."
    succeeded <- chrome_reached()
    if (isTRUE(succeeded)) break
    Sys.sleep(retry_delay)
  }

  "!DEBUG `if(succeeded) paste(url, 'found') else paste('...cannot find', url)`"
  succeeded
}

# Step 3: retrieve the websocket address ----------------------------------
chr_get_ws_addr <- function(debug_port) {
  "!DEBUG Retrieving Chrome websocket entrypoint at http://localhost:`debug_port`/json ..."
  open_debuggers <- tryCatch(
    jsonlite::read_json(sprintf("http://localhost:%s/json", debug_port), simplifyVector = TRUE),
    error = function(e) list()
  )

  address <- open_debuggers$webSocketDebuggerUrl[open_debuggers$type == "page"]
  if (is.null(address))
    "!DEBUG ...websocket entrypoint unavailable."
  else
    "!DEBUG ...found websocket entrypoint `address`"

  address # NULL when fails
}

# Step 4: configure the websocket connexion -------------------------------
ws_configure <- function(ws_endpoint, chr_process, work_dir) {
  "!DEBUG Configuring the websocket connexion..."
  ws <- tryCatch(DevToolsConnexion$new(ws_endpoint, autoConnect = FALSE),
                 error = function(e) NULL)

  if(is.null(ws)) {
    "!DEBUG ...failed to configure the websocket connexion."
    return(NULL)
  }

  ws$onOpen(function(event) {
    "!DEBUG ...R succesfully connected to headless Chrome through DevTools Protocol."
  })

  ws$onMessage(function(event) {
    "!DEBUG Got message from Chrome: `event$data`"
    data <- jsonlite::fromJSON(event$data)
  })

  ws$onClose(function(event) {
    "!DEBUG R disconnected from headless Chrome with code `event$code`"
    "!DEBUG and reason `event$reason`."
    later::later(~ chr_close(chr_process, work_dir), delay = 0.2)
  })

  ws$onError(function(event) {
    "!DEBUG Client failed to connect: `event$message`."
    later::later(~ chr_close(chr_process, work_dir), delay = 0.2)
  })

  reg.finalizer(ws, function(ws) {ws$close()})
  "!DEBUG ...websocket connexion configured."
  ws
}

chr_close <- function(chr_process, work_dir) {
  killed <- !chr_process$is_alive()

  if (!killed) {
    "!DEBUG Closing headless Chrome..."
    chr_process$kill()
    if (chr_process$is_alive()) {
      "!DEBUG Cannot close headless Chrome."
      stop("Cannot close headless Chrome.\n")
    } else {
      "!DEBUG ...headless Chrome closed."
    }
  }

  cleaned <- later::later(~chr_clean_work_dir(work_dir), 0.2)

  invisible(killed & cleaned)
}

chr_clean_work_dir <- function(work_dir) {
  cleaned <- !dir.exists(work_dir)

  if (!cleaned) {
    "!DEBUG Cleaning Chrome working directory..."
    result <- unlink(work_dir, recursive = TRUE, force = TRUE)
    cleaned <- result == 0

    if (cleaned)
      "!DEBUG ...Chrome working directory succesfully deleted."
    else
      "!DEBUG ...cannot supress the Chrome working directory: `work_dir` \nPlease remove it manually."
      stop("...cannot supress the Chrome working directory: ", work_dir,
          "\nPlease remove it manually.\n",
          sep = ""
      )
  }

  invisible(cleaned)
}

