context("test-http-methods")

test_that("fetch local protocol works and returns a list", {
  expect_is(fetch_protocol(local = TRUE), "list")
})

test_that("fetch_protocol() host argument must be a scalar character", {
  expect_error(fetch_protocol(host = c("localhost", "localhost")))
  expect_error(fetch_protocol(host = 127.1))
})

test_that("fetch_protocol() port argument must be a numeric or character scalar", {
  expect_error(fetch_protocol(port = TRUE))
  expect_error(fetch_protocol(port = c(9222, 9223)))
})

skip_if_not_chrome()

chrome <- Chrome$new()

test_that("fetch remote protocol works and returns a list", {
  expect_is(fetch_protocol(), "list")
})

chrome$close()
