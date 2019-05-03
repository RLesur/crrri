context("test-chrome")

setup_chrome_test()

test_that("is_alive() returns a logical", {
  expect_is(chrome$is_alive(), "logical")
})

test_that("Chrome cannot be launched if the port is already used", {
  expect_error(Chrome$new())
})

test_that("Chrome$new() returns a Chrome class object", {
  expect_is(chrome, "Chrome")
  expect_is(chrome, "CDPRemote")
  expect_is(chrome, "R6")
})

test_that("Chrome object can be safely printed", {
  expect_output(print(chrome))
})

test_that("connect() returns a CDPSession object that is closed with closeConnections()", {
  client_pr <- chrome$connect()
  expect_is(client_pr, "promise")
  client <- hold(client_pr)
  expect_is(client, "CDPSession")
  closed_pr <- chrome$closeConnections()
  expect_is(closed_pr, "promise")
  closed_pr_value <- hold(closed_pr)
  expect_reference(closed_pr_value, chrome)
  expect_equivalent(client$readyState(), 3L)
})

test_that("connect() can take a target_id as argument", {
  target_id <- list_targets()[[1]]$id
  client_pr <- chrome$connect(.target_id = target_id)
  expect_is(client_pr, "promise")
  client <- hold(client_pr)
  expect_is(client, "CDPSession")
  hold(client$disconnect())
})

test_that("connect() throws an error or returns a rejected promise if target_id is wrong", {
  target_id <- "1234"
  client_pr <- chrome$connect(.target_id = target_id)
  expect_is(client_pr, "promise")
  expect_error(hold(client_pr))
  expect_error(chrome$connect(.target_id = target_id, callback = function(client){}))
})

test_that("connect() creates a new tab if there is no tab", {
  client <- hold(chrome$connect())
  hold(client$closeTab())
  expect_length(list_targets(), 0L)
  client <- chrome$connect()
  expect_is(client, "promise")
  expect_silent(hold(client))
  hold(chrome$closeConnections())
})

test_that("closeConnections() returns a promise which fulfills when connections are closed. Its value is the remote object.", {
  client <- hold(chrome$connect())
  client2 <- hold(chrome$connect())
  expect_identical(length(chrome$listConnections()), 2L)
  res <- hold(chrome$closeConnections())
  expect_reference(res, chrome)
  expect_identical(length(chrome$listConnections()), 0L)
  # same thing without any connection
  res <- hold(chrome$closeConnections())
  expect_reference(res, chrome)
})

test_that("closeConnections() with a callback argument", {
  client <- hold(chrome$connect())
  client2 <- hold(chrome$connect())
  res <- NULL
  chrome$closeConnections(callback = function(x){res <<- x})
  hold(chrome$closeConnections())
  expect_reference(res, chrome)
  # re-run test without any connection
  res <- NULL
  expect_identical(length(chrome$listConnections()), 0L)
  chrome$closeConnections(callback = function(x){res <<- x})
  hold(chrome$closeConnections())
  expect_reference(res, chrome)
})

test_that("close() returns the Chrome object", {
  closed <- chrome$close()
  expect_reference(closed, chrome)
})

test_that("once closed, is_alive() return FALSE", {
  expect_identical(chrome$is_alive(), FALSE)
})


# chrome_execute ----------------------------------------------------------

test_that("With only 1 argument chrome_execute() returns the value of the async function", {
  value <- runif(1)
  async_fun <- function(client) {
    promises::promise_resolve(value)
  }
  expect_equal(chrome_execute(async_fun), value)
})

test_that("With multiple argument, chrome_execute() return a list with the values of the async functions", {
  values <- as.list(runif(3))
  async_funs <- values %>% purrr::map(~ function(client) promises::promise_resolve(.x))
  expect_identical(do.call(chrome_execute, async_funs), values)
})
