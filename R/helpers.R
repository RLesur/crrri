#' write base64 result to file
#'
#' This is a helper function to write some resulting data from chrome to file.
#' It will:
#' - decode the base64 encoded raw data
#' - write to file using [base::writeBin()]
#' It will be useful for function like [`Page$printToPDF()`](https://chromedevtools.github.io/devtools-protocol/tot/Page#method-printToPDF)
#'
#' @param res A resulting list object with some `data` field containing base64
#'   encoded data. (like [`Page$printToPDF()`](https://chromedevtools.github.io/devtools-protocol/tot/Page#method-printToPDF))
#' @param con A [connection][base::connections] object. See [base::writeBin()]
#'
#' @export
#'
#' @importFrom jsonlite base64_dec
write_base64 <- function(res, con) {
  assertthat::assert_that(assertthat::has_name(res, "data"))
  assertthat::assert_that(assertthat::is.string(res$data))
  decoded_res <- jsonlite::base64_dec(res$data)
  writeBin(decoded_res, con = con)
}
