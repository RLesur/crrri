context("test-chrome")

test_that("we get the proxy env var correctly", {
  expect_identical(get_proxy(), "")
  withr::with_envvar(
    c(https_proxy = "dummy"),
    expect_identical(get_proxy(), "dummy")
  )
  withr::with_envvar(
    c(HTTP_PROXY = "dummy"),
    expect_identical(get_proxy(), "dummy")
  )
})

test_that("Proxy is correctly passed to chrome", {
  expect_identical(get_no_proxy_urls(), c("localhost", "127.0.0.1"))
  old <- Sys.getenv("NO_PROXY")
  Sys.setenv(NO_PROXY = "noproxy1;noproxy2,noproxy3")
  expect_identical(get_no_proxy_urls(),
                   c("localhost", "127.0.0.1", "noproxy1", "noproxy2", "noproxy3")
  )
  Sys.setenv(NO_PROXY = old)
  old <- Sys.getenv("no_proxy")
  Sys.setenv(no_proxy = "noproxy1;noproxy2,localhost")
  expect_identical(get_no_proxy_urls(),
                   c("localhost", "127.0.0.1", "noproxy1", "noproxy2")
  )
  Sys.setenv(no_proxy = old)
})

test_that("Use specify chrome if set", {
  withr::with_envvar(
    c(HEADLESS_CHROME = "path/to/chrome"),
    expect_identical(find_chrome_binary(), "path/to/chrome")
  )
})

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


context("test perform_with_chrome")

test_that("funs pass as .list must be a list", {
  fun <- function(client) 1
  expect_error(perform_with_chrome(.list = fun), regexp = ".list must be a list")
})

test_that("With only 1 argument perform_with_chrome() returns the value of the async function invisibly", {
  value <- runif(1)
  async_fun <- function(client) {
    promises::promise_resolve(value)
  }
  expect_identical(perform_with_chrome(async_fun), value)
  # if not async, return invisibly
  expect_invisible(perform_with_chrome(async_fun, async = FALSE))
  # if async, result is a promise
  pr <- perform_with_chrome(async_fun, async = TRUE)
  expect_s3_class(pr, "promise")
  hold(pr)
})

test_that("With multiple argument, perform_with_chrome() returns a list with the values of the async functions if they are not NULL", {
  values <- as.list(runif(3))
  async_funs <- purrr::map(values, ~ function(client) promises::promise_resolve(.x))
  expect_identical(do.call(perform_with_chrome, async_funs), values)
})

test_that("With multiple arguments, if one of the async function returns NULL, ensure that the length of the result list is equal to the number of funs", {
  values <- vector("list", 3L)
  async_funs <- purrr::map(values, ~ function(client) promises::promise_resolve(.x))
  expect_length(do.call(perform_with_chrome, async_funs), length(values))
})

test_that("rejects if one promises get rejected", {
  async_funs <- list(fun1 = function(client) promises::promise_resolve(1L),
                     fun2 = function(client) promises::promise_reject("fun2 rejected"))
  expect_error(perform_with_chrome(.list = async_funs), "fun2 rejected")
})

test_that("timeouts are respected and recycled (using JS in chrome)", {
  async_fun <- function(ms) {
    function(client) {
      Runtime <- client$Runtime
      Runtime$enable() %...>% {
        Runtime$evaluate(
          expression = paste0(
            'function sleep(ms) {',
            'return new Promise(resolve => setTimeout(resolve, ms));',
            '};',
            'async function wait() {',
            'var n = Date.now();',
            'await sleep(', ms, ');',
            'var n2 = Date.now()-n;',
            'console.log(n2); return n2;}',
            'wait();'),
          awaitPromise = TRUE
        )}
    }
  }
  async_funs <- list(
    async_fun(500),
    async_fun(3000)
  )
  expect_error(perform_with_chrome(.list = async_funs, timeouts = c(30, 1)),
               "The delay of 1 seconds expired in async function n-2.")
  expect_error(perform_with_chrome(.list = async_funs, timeouts = c(2)),
               "The delay of 2 seconds expired in async function n-2.")
  skip_on_os("windows")
  expect_error(perform_with_chrome(.list = async_funs, timeouts = c(1)),
               "The delay of 1 seconds expired in async function n-2.")
})

test_that("timeouts are respected and recycled (using R only)", {
  async_funs <- list(
    function(client) {
      promises::promise(~later::later(~resolve(1), delay = 0))
    },
    function(client) {
      promises::promise(~later::later(~resolve(2), delay = 3))
    }
  )
  expect_error(perform_with_chrome(.list = async_funs, timeouts = c(30, 1)),
               "The delay of 1 seconds expired in async function n-2.")
  expect_error(perform_with_chrome(.list = async_funs, timeouts = c(2)),
               "The delay of 2 seconds expired in async function n-2.")
  skip_on_os("windows")
  expect_error(perform_with_chrome(.list = async_funs, timeouts = c(1)),
               "The delay of 1 seconds expired in async function n-2.")
})

test_that("funs must be async functions", {
  fun <- function(client) 1
  expect_error(perform_with_chrome(fun))
})
