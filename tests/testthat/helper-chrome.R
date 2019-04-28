skip_if_not_chrome <- function() {
  if (nzchar(Sys.getenv("HEADLESS_CHROME"))) {
    return(invisible(TRUE))
  }
  testthat::skip("Chrome is required to run this tests\nand is not available in the current testing environment.")
}
