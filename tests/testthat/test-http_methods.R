context("test-http-methods")

# These tests can be run without Chrome

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

setup_chrome_test()

# fetch_version() tests
test_that("fetch_version() returns a list", {
  expect_is(fetch_version(), "list")
})

# combined tests
initial_target <- list_targets()[[1]]

test_that("list_targets() returns a list of length 1 when Chrome opens", {
  expect_is(list_targets(), "list")
  expect_identical(length(list_targets()), 1L)
})

test_that("new_tab deals with wrong url arg", {
  expect_error(new_tab(url = 3))
  expect_error(new_tab(url = c("localhost", "www.google.com")))
})

new_target <- new_tab(url = "https://www.r-project.org/")

test_that("new_tab can open a with a new url", {
  expect_identical(new_target$url, "https://www.r-project.org/")
  expect_identical(new_target$type, "page")
})

test_that("new_tab() returns a list and increment the length of list_targets()", {
  expect_is(new_target, "list")
  expect_identical(length(list_targets()), 2L)
})

test_that("activate_target() returns TRUE if the target exists, FALSE otherwise", {
  expect_identical(activate_target(target_id = initial_target$id), TRUE)
  expect_identical(activate_target(target_id = "1234"), FALSE)
})

test_that("close_target() returns TRUE if the target exists and reduce the length of list_targets(), FALSE otherwise.", {
  expect_identical(close_target(target_id = new_target$id), TRUE)
  expect_identical(close_target(target_id = "1234"), FALSE)
  expect_identical(length(list_targets), 1L)
})

test_that("fetch remote protocol works and returns a list", {
  expect_is(fetch_protocol(), "list")
})

test_that("inspect_target() throws an error for a wrong target_id", {
  expect_error(inspect_target(target_id = new_target$id))
})

test_that("inspect_target() returns NULL for a correct target_id", {
  skip_if_not(interactive())
  expect_identical(inspect_target(target_id = initial_target$id), NULL)
})

test_that("inspect_target() returns NULL with a warning() in a non interactive session", {
  skip_if(interactive())
  expect_warning(res <- inspect_target(target_id = initial_target$id))
  expect_identical(res, NULL)
})

test_that("is_localhost", {
  expect_true(is_localhost("http://localhost:9222"))
  expect_true(is_localhost("http://127.0.0.1:9222"))
  expect_false(is_localhost("https://github.com/RLesur/crrri"))
  expect_false(is_localhost(""))
})

test_that("browse_url use default function if no option set", {
  old_opt <- options(viewer = NULL)
  url <- "http://localhost:9222"
  expect_identical(
    with_mock(
      browseURL = identity,
      expect_identical(browse_url(url), url)
    ),
    url)
  options(viewer = old_opt)
})

test_that("browse_url use default function if no localhost", {
  url <- "https://github.com/RLesur/crrri"
  expect_identical(
    with_mock(
      browseURL = identity,
      expect_identical(browse_url(url), url)
    ),
    url)
})

