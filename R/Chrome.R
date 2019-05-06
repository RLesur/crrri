#' @include CDPRemote.R utils.R wait.R
#' @importFrom assertthat assert_that is.scalar is.number
NULL

#' Execute an asynchronous CDP flow with Chrome
#'
#' The `chrome_execute()` function executes an asynchronous Chrome DevTools
#' Protocol flow with Chromium/Chrome and can turn it into a synchronous function.
#' An asynchronous remote flow is a function that takes a connection object and
#' returns a [promise][promises::promise].
#' If several functions are passed to `chrome_executes()`, their execution is
#' serial. If one of the asynchronous functions fails, the whole execution also
#' fails.
#'
#' @param ... Asynchronous remote flow functions.
#' @param .list A list of asynchronous remote flow functions - an alternative to
#' `...`.
#' @param timeouts A vector of timeouts applied to each asynchronous function.
#'     Repeated.
#' @param cleaning_timeout The delay for cleaning Chrome.
#' @param async Is the result a promise? Required for using `chrome_execute()`
#'     in Shiny.
#' @param bin Character scalar, the path to Chromium or Chrome executable.
#' @param debug_port Integer scalar, the Chromium/Chrome remote debugging port.
#' @param local Logical scalar, indicating whether the local version of the
#'     protocol (embedded in `crrri`) must be used or the protocol must be
#'     fetched _remotely_.
#' @param extra_args Character vector, extra command line arguments passed to
#'     Chromium/Chrome.
#' @param headless Logical scalar, indicating whether Chromium/Chrome is launched
#'     in headless mode.
#' @param retry_delay Number, delay in seconds between two successive tries to
#'     connect to headless Chromium/Chrome.
#' @param max_attempts Logical scalar, number of tries to connect to headless
#'     Chromium/Chrome.
#'
#' @return An invisible list with the values of the fulfilled promises for each
#'     async function.d If there is only async function, the return value is the value of the
#'     fulfilled promise.
#' @export
#'
#' @examples
#' \dontrun{
#' async_save_as_pdf <- function(url) {
#'   function(client) {
#'     Page <- client$Page
#'
#'     Page$enable() %...>% {
#'       Page$navigate(url = url)
#'       Page$loadEventFired()
#'     } %...>% {
#'       Page$printToPDF()
#'     } %...>% {
#'       .$data %>%
#'         jsonlite::base64_dec() %>%
#'         writeBin(paste0(httr::parse_url(url)$hostname, ".pdf"))
#'     }
#'   }
#' }
#'
#' save_as_pdf <- function(...) {
#'   list(...) %>%
#'     purrr::map(async_save_as_pdf) %>%
#'     chrome_execute(.list = .)
#' }
#'
#' save_as_pdf("https://www.r-project.org/", "https://rstudio.com/")
#' }
chrome_execute <- function(
  ..., .list = NULL, timeouts = 30, cleaning_timeout = 30, async = FALSE,
  bin = Sys.getenv("HEADLESS_CHROME"), debug_port = 9222L, local = FALSE,
  extra_args = NULL, headless = TRUE, retry_delay = 0.2, max_attempts = 15L
) {
  if(is.null(.list)) {
    funs <- list(...)
  } else {
    assert_that(is_list(.list))
    funs <- .list
  }

  # check arguments
  purrr::walk(funs, check_is_single_param_fun)
  assert_that(is.numeric(timeouts))
  assert_that(is.number(cleaning_timeout))

  # initialize objects
  timeouts <- rep_len(timeouts, length(funs))
  total_timeout <- sum(timeouts) + cleaning_timeout

  # launch Chrome
  chrome <- Chrome$new(
    bin = bin, debug_port = debug_port, local = local, extra_args = extra_args,
    headless = headless, retry_delay = retry_delay, max_attempts = max_attempts
  )
  # connect to client
  client <- chrome$connect()

  # associate a function with its timeout
  execute_fun <- function(index) {
    fun <- purrr::pluck(funs, index)
    delay <- purrr::pluck(timeouts, index)
    res <- promises::then(client, function(value) {
      res <- (fun)(value)
      # fun must be an async function, i.e. a function that returns a promise
      if(!promises::is.promising(res)) {
        stop(paste0("Function n-", index, " passed to chrome_execute does not return a promise."))
      }
      res
    })
    timeout(res,
            delay = delay,
            msg = paste0("The delay of ", delay, " seconds expired in async function n-", index, ".\n"))
  }

  all_funs_executed <- promises::promise_map(seq_along(funs), execute_fun)

  # if only one fun applied, returns the element inside the length 1 list
  results_available <- promises::then(
    all_funs_executed,
    onFulfilled = function(value) {
      if(length(value) == 1L) {
        value <- value[[1]]
      }
      value
    }
  )

  results_after_cleaning <- promises::finally(results_available, onFinally = function() {
    # it seems that using hold(), i.e. later::run_now() in finally is not a problem
    # FMPOV, this seems completely weird, but it works well
    chrome$close(async = FALSE)
  })

  if(isTRUE(async)) {
    return(results_after_cleaning)
  }

  invisible(hold(results_after_cleaning, timeout = total_timeout))
}

#' Launch Chromium or Chrome
#'
#' This class aims to launch Chromium or Chrome in headless mode. It possesses
#' methods to manage connections to headless Chromium/Chrome using the
#' Chrome Debugging Protocol.
#'
#' @section Usage:
#' ```
#' remote <- Chrome$new(bin = Sys.getenv("HEADLESS_CHROME"), debug_port = 9222L,
#'                      local = FALSE, extra_args = NULL, headless = TRUE,
#'                      retry_delay = 0.2, max_attempts = 15L)
#'
#' remote$connect(callback = NULL)
#' remote$listConnections()
#' remote$closeConnections(callback = NULL)
#' remote$version()
#' remote$user_agent
#'
#' remote$close(async = FALSE)
#' remote$view()
#' remote$is_alive()
#' ```
#'
#' @section Arguments:
#' * `remote`: `Chrome` object representing a remote instance of headless
#'     Chromium/Chrome.
#' * `bin`: Character scalar, the path to Chromium or Chrome executable.
#' * `debug_port`: Integer scalar, the Chromium/Chrome remote debugging port.
#'     Note that headless Chromium/Chrome will be available at
#'     `http://localhost:<debug_port>`.
#' * `local`: Logical scalar, indicating whether the local version of the
#'     protocol (embedded in `crrri`) must be used or the protocol must be
#'     fetched _remotely_.
#' * `extra_args`: Character vector, extra command line arguments passed to
#'     Chromium/Chrome.
#' * `headless`: Logical scalar, indicating whether Chromium/Chrome is launched
#'     in headless mode.
#' * `retry_delay`: Number, delay in seconds between two successive tries to
#'     connect to headless Chromium/Chrome.
#' * `max_attempts`: Logical scalar, number of tries to connect to headless
#'     Chromium/Chrome.
#' * `callback`: Function with one argument.
#' * `async`: Does the function return a promise?
#'
#' @section Details:
#' `$new()` opens a new headless Chromium/Chrome.
#'
#' `$connect(callback = NULL)` connects the R session to the remote instance of
#' headless Chromium/Chrome. The returned value depends on the value of the
#' `callback` argument. When `callback` is a function, the returned value is a
#' connection object. When `callback` is `NULL` the returned value is a promise
#' which fulfills once R is connected to the remote instance of Chromium/Chrome.
#' Once fulfilled, the value of this promise is the connection object.
#'
#' `$listConnections()` returns a list of the connection objects succesfully
#' created using the `$connect()` method.
#'
#' `$closeConnections(callback = NULL)` closes all the connections created using the
#' `$connect()` method.  If `callback` is `NULL`, it returns a promise which
#' fulfills when all the connections are closed: once fulfilled, its value is the
#' remote object.
#' If `callback` is not `NULL`, it returns the remote object. In this case,
#' `callback` is called when all the connections are closed and the remote object is
#' passed to this function as the argument.
#'
#' `$version()` executes the DevTools `Version` method. It returns a list of
#' informations available at `http://localhost:<debug_port>/json/version`.
#'
#' `$user_agent` returns a character scalar with the User Agent of the
#' headless Chromium/Chrome.
#'
#' `$close(async = FALSE)` closes the remote instance of headless
#' Chromium/Chrome. If `async` is `FALSE` this method returns the `remote`
#' object invisibly. Is `async` is `TRUE`, a promise is returned. This promise
#' fulfills when Chromium/Chrome is closed. Once fulfilled, its value is the
#' `remote` object.
#'
#' `$view()` opens a visible Chromium/Chrome browser at
#' `http://localhost:<debug_port>`. This is useful to 'see' the headless
#' Chromium/Chrome instance. Returns the process of the visible browser.
#'
#' `$is_alive()` checks if the remote instance is alive. Returns a logical
#' scalar.
#'
#' `$listTargets()` returns a list with information about tabs.
#' @name Chrome
#' @examples
#' \dontrun{
#'
#' remote <- Chrome$new()
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
#'   })
#' }) %...!% {
#'   cat("Error:", .$message, "\n")
#' } %>%
#'   promises::finally(~ remote$close())
#' }
#'
NULL

#' @export
Chrome <- R6::R6Class(
  "Chrome",
  inherit = CDPRemote,
  public = list(
    initialize = function(
      bin = Sys.getenv("HEADLESS_CHROME"), debug_port = 9222L, local = FALSE,
      extra_args = NULL, headless = TRUE, retry_delay = 0.2, max_attempts = 15L
    ) {
      assert_that(is_scalar_character(bin))
      assert_that(
        is_scalar_integer(debug_port),
        is_user_port(debug_port),
        is_available_port(debug_port)
      )
      assert_that(is.scalar(local), is.logical(local))
      assert_that(is.scalar(headless), is.logical(headless))
      assert_that(is.number(retry_delay))
      assert_that(is_scalar_integer(max_attempts))

      private$.bin <- bin
      work_dir <- chr_new_data_dir()
      chr_process <- chr_launch(bin, debug_port, extra_args, headless, work_dir)
      private$.work_dir <- work_dir
      private$.process <- chr_process
      super$initialize(host = "localhost",
                       debug_port = debug_port,
                       secure = FALSE,
                       local = local,
                       retry_delay = retry_delay,
                       max_attempts = max_attempts
      )
      if(!private$.reachable) {
        warning("...closing Chrome.")
        private$finalize()
      }
    },
    close = function(async = FALSE) {
      if(isTRUE(async)) {
        return(private$.async_finalizer())
      }
      invisible(private$finalize())
    },
    view = function() {
      chr_launch(
        private$.bin,
        debug_port = NULL,
        extra_args = c(
          build_http_url(private$.host, private$.port, private$.secure),
          '--new-window',
          '--no-default-browser-check',
          '-incognito'
        ),
        headless = FALSE,
        work_dir = NULL
      )
    },
    is_alive = function() private$.process$is_alive(),
    print = function() {
      super$print()
      cat('  Running:', self$is_alive())
    }
  ),
  private = list(
    .bin = NULL,
    .work_dir = NULL,
    .process = NULL,
    .async_finalizer = function() {
      clients_disconnected <- timeout(
        self$closeConnections(),
        delay = 10,
        msg = "The WebSocket connections have not been properly closed."
      )
      # if the delay expires, this is not really a problem:
      # they will be closed when we will kill chrome
      caught <- promises::catch(
        clients_disconnected,
        function(err) {
          warning(err$message, call. = FALSE, immediate. = TRUE)
        }
      )
      # now, kill chrome and clean the working directory
      killed_and_cleaned <- promises::finally(
        clients_disconnected,
        onFinally = function() {
          killed <- !private$.process$is_alive()
          if (!killed) {
            "!DEBUG Closing headless Chrome..."
            private$.process$kill()
            if (private$.process$is_alive()) {
              "!DEBUG Cannot close headless Chrome."
              stop("Cannot close headless Chrome.\n")
            } else {
              "!DEBUG ...headless Chrome closed."
            }
            private$.process$wait()
          }
          chr_clean_work_dir(private$.work_dir)
        }
      )
      killed_and_cleaned
    },
    finalize = function() {
      killed_and_cleaned <- private$.async_finalizer()
      # since we are in finalize(), we can use hold() safely:
      hold(
        killed_and_cleaned,
        timeout = 30,
        msg = "Did not succeed to close Chrome properly."
      )
    }
  )
)

chr_new_data_dir <- function(length = 8, slug = "chrome-data-dir-") {
  user_data_dir <- rappdirs::user_data_dir(appname = "r-crrri")
  random_string <- paste(sample(letters, size = length, replace = TRUE), collapse = "")
  normalizePath(file.path(user_data_dir, paste0(slug, random_string)), mustWork = FALSE)
}

# Launch Chrome ---------------------------------------------------
# This function launches a new Chrome processus
# The user has to provide a working directory for Chrome: see the helper function chr_new_data_dir()
# The command can silently fail: in this case, NULL is returned.
chr_launch <- function(
  bin = Sys.getenv("HEADLESS_CHROME"), debug_port = 9222, extra_args = NULL, headless = TRUE, work_dir
) {

  proxy <- get_proxy()
  behind_proxy <- nzchar(proxy)
  travis <- nzchar(Sys.getenv("TRAVIS"))

  if (behind_proxy)
    extra_args <- c(chr_proxy_args(proxy), extra_args)

  if (travis)
    extra_args <- c(chr_travis_args(), extra_args)

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
    "!DEBUG Chrome succesfully launched `if (headless) 'in headless mode'`."
    "!DEBUG It should be accessible at http://localhost:`debug_port`"
  } else {
    stop("Cannot launch Chrome. ",
         "Please add the path to your Chrome bin.",
         call. = FALSE
    )
  }

  chr_process
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
  urls <- do.call(c, strsplit(env_var, "[,;]"))
  urls <- c(default_no_proxy_urls(), unname(urls))
  unique(urls)
}

default_no_proxy_urls <- function() {
  c("localhost", "127.0.0.1")
}

is_os_type <- function(os) {
  identical(.Platform$OS.type, os)
}

chr_windows_args <- function(headless) {
  if (headless) c("--disable-gpu", "--no-sandbox")
}

chr_headless_args <- function(headless) {
  if(isTRUE(headless))
    c("--headless")
  else
    c("--new-window")
}

chr_default_args <- function() {
  c("--no-first-run")
}

chr_travis_args <- function() {
  c("--disable-gpu", "--no-sandbox")
}

chr_work_dir_args <- function(work_dir) {
  if(!is.null(work_dir)) {
    paste("--user-data-dir", work_dir, sep = "=")
  }
}

chr_debugging_port_args <- function(debug_port) {
  if(!is.null(debug_port)) {
    paste("--remote-debugging-port", debug_port, sep = "=")
  }
}

# cleaner helpers -----------------------------------------------
chr_clean_work_dir <- function(work_dir) {
  cleaned <- !dir.exists(work_dir)

  if (!cleaned) {
    "!DEBUG Cleaning Chrome working directory..."
    Sys.sleep(0.5)
    result <- unlink(work_dir, recursive = TRUE, force = TRUE)
    cleaned <- result == 0

    if (cleaned) {
      "!DEBUG ...Chrome working directory succesfully deleted."
    } else {
      "!DEBUG ...cannot supress the Chrome working directory: `work_dir` \nPlease remove it manually."
      warning("...cannot supress the Chrome working directory: ", work_dir,
           "\nPlease remove it manually.\n", call. = FALSE, immediate. = TRUE
      )
    }
  }

  invisible(cleaned)
}
