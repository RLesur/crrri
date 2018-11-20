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
    chr_close(chr_process)
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
        resolve(devtoolscnx(ws, NULL))
      })
      ws$onError(function(event) {
        msg <- paste0("Client failed to connect: ", event$message, ".")
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
    result <- devtoolscnx(ws, NULL)
  }

  if (isTRUE(auto_connect) & !is.null(ws)) {
    cat("Connecting R to Chrome...\n")
    ws$connect()
  }

  return(result)
}

chr_new_data_dir <- function(length = 8, slug = "chrome-data-dir-") {
  random_string <- paste(sample(letters, size = length, replace = TRUE), collapse = "")
  paste0(slug, random_string)
}

devtoolscnx <- function(ws, result) {
  obj <- list(ws = ws, result = result)
  class(obj) <- "devtoolscnx"
  obj
}

#' Coerce to a promise
#'
#' @param obj A DevTools connexion.
#'
#' @return A promise.
#' @export
as.promise.devtoolscnx <- function(x) {
  promises::promise(function(resolve, reject) {
    if (x$ws$readyState() == 0) {
      x$ws$onOpen(function(event) {
        resolve(x)
      })
    }
    if (x$ws$readyState() == 2 | x$ws$readyState() == 3) {
      reject("Closed connexion.")
    }
    if (x$ws$readyState() == 1) {
      resolve(x)
    }
  })
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

  cat("Trying to launch Chrome", if (headless) " in headless mode", "...\n", sep = "")

  chr_process <-
    tryCatch(processx::process$new(bin, chrome_args, echo_cmd = TRUE),
             error = function(e) NULL
    )

  if (!is.null(chr_process)) {
    reg.finalizer(chr_process,
                  function(process) chr_close(process, work_dir),
                  onexit = TRUE
    )
    cat("Chrome succesfully launched", if (headless) " in headless mode", ".\n",
        "It should be accessible at http://localhost:", debug_port, "\n",
        sep = ""
    )
  } else {
    cat("Cannot launch Chrome. Please check your system configuration.\n")
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
  cat("Trying to find", url, "\n")
  for (i in 1:max_attempts) {
    cat(i, "...", sep = "")
    succeeded <- chrome_reached()
    if (isTRUE(succeeded)) break
    Sys.sleep(retry_delay)
  }

  if (isTRUE(succeeded))
    cat("", url, "found.\n")
  else
    cat("\n...cannot find", url, "\n")

  succeeded
}

# Step 3: retrieve the websocket address ----------------------------------
chr_get_ws_addr <- function(debug_port) {
  cat("Retrieving Chrome websocket entrypoint at http://localhost:", debug_port, "/json ...\n", sep = "")

  open_debuggers <- tryCatch(
    jsonlite::read_json(sprintf("http://localhost:%s/json", debug_port), simplifyVector = TRUE),
    error = function(e) list()
  )

  address <- open_debuggers$webSocketDebuggerUrl[open_debuggers$type == "page"]
  if (is.null(address))
    cat("...websocket entrypoint unavailable.\n")
  else
    cat("...found websocket entrypoint", address, "\n")

  address # NULL when fails
}

# Step 4: configure the websocket connexion -------------------------------
ws_configure <- function(ws_endpoint, chr_process, work_dir) {
  cat("Configuring the websocket connexion...\n")
  ws <- tryCatch(websocket::WebSocket$new(ws_endpoint, autoConnect = FALSE),
                 error = function(e) NULL)

  if(is.null(ws)) {
    cat("...failed to configure the websocket connexion.\n")
    return(NULL)
  }

  ws$onOpen(function(event) {
    cat("...R succesfully connected to headless Chrome through DevTools Protocol.\n")
  })

  ws$onMessage(function(event) {
    data <- jsonlite::fromJSON(event$data)
    cat("Got message from Chrome:", event$data, "\n")
  })

  ws$onClose(function(event) {
    cat("R disconnected from headless Chrome with code ", event$code,
        " and reason ", event$reason, ".\n", sep = "")
    later::later(~ chr_close(chr_process, work_dir), delay = 0.2)
  })

  ws$onError(function(event) {
    cat("Client failed to connect: ", event$message, ".", "\n", sep = "")
    later::later(~ chr_close(chr_process, work_dir), delay = 0.2)
  })

  reg.finalizer(ws, function(ws) {ws$close()})
  cat("...websocket connexion configured.\n")
  ws
}

chr_close <- function(chr_process, work_dir) {
  killed <- !chr_process$is_alive()

  if (!killed) {
    cat("Closing headless Chrome...\n")
    killed <- chr_process$kill()
    if (killed)
      cat("...headless Chrome closed.\n")
    else
      cat("Cannot close headless Chrome.")
  }

  cleaned <- later::later(~chr_clean_work_dir(work_dir), 0.2)

  invisible(killed & cleaned)
}

chr_clean_work_dir <- function(work_dir) {
  cleaned <- !dir.exists(work_dir)

  if (!cleaned) {
    cat("Cleaning Chrome working directory...\n")
    result <- unlink(work_dir, recursive = TRUE, force = TRUE)
    cleaned <- result == 0

    if (cleaned)
      cat("...Chrome working directory succesfully deleted.\n")
    else
      cat("...cannot supress the Chrome working directory: ", work_dir,
          "\nPlease remove it manually.\n",
          sep = ""
      )
  }

  invisible(cleaned)
}

