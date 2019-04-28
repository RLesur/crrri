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

new_target <- new_tab()

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
  expect_identical(close_target(target_id = new_target$id), FALSE)
  expect_identical(length(list_targets), 1L)
})

test_that("fetch remote protocol works and returns a list", {
  expect_is(fetch_protocol(), "list")
})

test_that("inspect_target() throws an error for a wrong target_id", {
  expect_error(inspect_target(target_id = new_target$id))
})

if(interactive()) {
  test_that("inspect_target() returns NULL for a correct target_id", {
    expect_identical(inspect_target(target_id = initial_target$id), NULL)
  })
} else {
  test_that("inspect_target() returns NULL with a warning() in a non interactive session", {
    expect_identical(inspect_target(target_id = initial_target$id), NULL)
    expect_warning(inspect_target(target_id = initial_target$id))
  })
}

