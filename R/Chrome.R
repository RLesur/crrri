#' @include CDPRemote.R
NULL

#' @export
Chrome <- R6::R6Class(
  "Chrome",
  inherit = CDPRemote,
  public = list(
    initialize = function(
      bin = Sys.getenv("HEADLESS_CHROME"), debug_port = 9222, local = FALSE,
      extra_args = NULL, headless = TRUE, retry_delay = 0.2, max_attempts = 15L
    ) {
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
    close = function() {
      private$finalize()
    },
    is_alive = function() private$.process$is_alive()
  ),
  private = list(
    .bin = NULL,
    .work_dir = NULL,
    .process = NULL,
    finalize = function() {
      self$closeConnections()
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
    "!DEBUG Chrome succesfully launched `if (headless) 'in headless mode'`."
    "!DEBUG It should be accessible at http://localhost:`debug_port`"
  } else {
    stop("Cannot launch Chrome. Please check your system configuration.", call. = FALSE)
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
  c("--disable-gpu", if (headless) "--no-sandbox")
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

chr_work_dir_args <- function(work_dir) {
  paste("--user-data-dir", work_dir, sep = "=")
}

chr_debugging_port_args <- function(debug_port) {
  paste("--remote-debugging-port", debug_port, sep = "=")
}

# cleaner helpers -----------------------------------------------
chr_clean_work_dir <- function(work_dir) {
  cleaned <- !dir.exists(work_dir)

  if (!cleaned) {
    "!DEBUG Cleaning Chrome working directory..."
    result <- unlink(work_dir, recursive = TRUE, force = TRUE)
    cleaned <- result == 0

    if (cleaned) {
      "!DEBUG ...Chrome working directory succesfully deleted."
    } else {
      "!DEBUG ...cannot supress the Chrome working directory: `work_dir` \nPlease remove it manually."
      warning("...cannot supress the Chrome working directory: ", work_dir,
           "\nPlease remove it manually.\n", call. = FALSE
      )
    }
  }

  invisible(cleaned)
}
