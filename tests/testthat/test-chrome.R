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
  client_pr <- chrome$connect(target_id = target_id)
  expect_is(client_pr, "promise")
  client <- hold(client_pr)
  expect_is(client, "CDPSession")
  client$disconnect()
})

test_that("connect() throws an error or returns a rejected promise if target_id is wrong", {
  target_id <- "1234"
  client_pr <- chrome$connect(target_id = target_id)
  expect_is(client_pr, "promise")
  expect_error(hold(client_pr))
  expect_error(chrome$connect(target_id = target_id, callback = function(client){}))
})

test_that("close() returns the Chrome object", {
  closed <- chrome$close()
  expect_reference(closed, chrome)
})

test_that("once closed, is_alive() return FALSE", {
  expect_identical(chrome$is_alive(), FALSE)
})


