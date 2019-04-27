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

setup({
  rlang::env_bind(rlang::global_env(), chrome = Chrome$new())
})
teardown({
  if (chrome$is_alive()) {
    message("closing chrome")
    chrome$close()
  }
  rlang::env_unbind(rlang::global_env(), nms = "chrome")
})

test_that("fetch remote protocol works and returns a list", {
  expect_is(fetch_protocol(), "list")
})
