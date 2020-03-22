skip_if_not_chrome <- function() {
  if (nzchar(Sys.getenv("HEADLESS_CHROME"))) {
    return(invisible(TRUE))
  }
  testthat::skip("Chrome is required to run this tests\nand is not available in the current testing environment.")
}

setup_chrome_test <- function(env = rlang::caller_env()) {
  skip_if_not_chrome()
  # create chrome object in the test environment
  setup({
    capture.output(
      rlang::env_bind(.env = env, chrome = Chrome$new())
    )
  },
  # we need this because these function are normally called in the test file directly
  env = env)
  # close connection and delete object after the test
  teardown({
    if (chrome$is_alive()) {
      chrome$close()
    }
    # Env corresponding to test env where chrome is, is the parent env
    rlang::env_unbind(env = rlang::env_parent(), nms = "chrome")
  },
  # we need this because these function are normally called in the test file directly
  env = env)
}

without_verbose <- function(code) {
  old <- getOption("crrri.verbose", TRUE)
  options(crrri.verbose = FALSE)
  on.exit(options(crrri.verbose = old))
  force(code)
}
