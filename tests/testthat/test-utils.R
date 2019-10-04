test_that("as_predicate can be used with formula, function or a value to match identically", {
  expect_true(as_predicate(~ .x == 3L)(3L))
  expect_true(as_predicate(3L)(3L))
  expect_true(as_predicate(is.integer)(3L))
})

test_that("A character value is used to build a predicate with identical", {
  # a character is not passed to rlang::as_function
  # identical is used to create a predicate
  expect_false(as_predicate("is.integer")(3L))
  expect_true(as_predicate("is.integer")("is.integer"))
})

test_that("as_predicate controls that the result of a function is TRUE or FALSE", {
  f <- as_predicate(as.character)
  expect_error(f(1))
  f <- as_predicate(~ TRUE)
  expect_identical(f(1), TRUE)
})

test_that("combine_predicates function returns TRUE if there is no predicate function", {
  f <- combine_predicates(list())
  expect_identical(f(list(a = 1, b = 2)), TRUE)
})

test_that("combine_predicates function returns TRUE if the predicates are met", {
  f <- combine_predicates(list(a = function(x) x == 1, b = function(x) x == 2))
  expect_identical(f(list(b = 2)), FALSE)
  expect_identical(f(list(a = 1, b = 1)), FALSE)
  expect_identical(f(list(a = 1, b = 2)), TRUE)
  expect_identical(f(list(a = 1, b = 2, c = 3)), TRUE)
})

test_that("we can built an event listener that takes predicates as arguments and return a predicate function", {
  build_predicate <- function(a, b, callback = NULL) {
    predicate_fun <-
      rlang::fn_fmls_names() %>% # pick the fun arguments
      utils::head(-1) %>% # remove the callback argument
      rlang::env_get_list(nms = ., inherit = TRUE) %>% # retrieve arguments values
      purrr::discard(~ purrr::is_null(.x)) %>% # remove arguments identical to NULL
      purrr::map(as_predicate) %>%
      combine_predicates()
    predicate_fun
  }
  f <- build_predicate(a = ~ .x == 1, b = ~ .x == 2)
  expect_identical(f(list(b = 2)), FALSE)
  expect_identical(f(list(a = 1, b = 1)), FALSE)
  expect_identical(f(list(a = 1, b = 2)), TRUE)
  expect_identical(f(list(a = 1, b = 2, c = 3)), TRUE)
})

test_that("new_callback_wrapper only works on function (lambda or not)", {
  expect_silent(new_callback_wrapper(identity, identity))
  expect_error(new_callback_wrapper('identity', identity))
  expect_error(new_callback_wrapper(identity, 'identity'))
  expect_silent(new_callback_wrapper(rlang::as_function( ~ .x == 3L), identity))
})

test_that("new_callback_wrapper result prints correctly", {
  expect_identical(capture.output(print(new_callback_wrapper(identity, identity))),
                c("=== wrapper over function ===", "function (x) ", "x "))
})

test_that("new_callback_wrapper wraps callback in the function", {
  wrapped_fun <- new_callback_wrapper(identity, sum)
  expect_s3_class(wrapped_fun, "crrri_callback_wrapper")
  expect_equivalent(attr(wrapped_fun, "callback"), sum)
  expect_identical(wrapped_fun(1), identity(1))
  wrapped_fun2 <- new_callback_wrapper(as.character, wrapped_fun)
  expect_s3_class(wrapped_fun2, "crrri_callback_wrapper")
  # the callback is the one from wrapped_fun
  expect_equivalent(attr(wrapped_fun2, "callback"), sum)
  expect_identical(wrapped_fun2(1), "1")
})

test_that("kill_zombie kills Chrome", {
  zombie <- Chrome$new(debug_port = 6666L)
  expect_message(kill_zombie(6666), "killed")
  expect_error(hold(CDPSession(port = 6666)))
  expect_false(zombie$is_alive())
})

test_that("is_user_port is between 1024 and 49151", {
  expect_true(is_user_port(1056))
  expect_true(is_user_port(1024))
  expect_true(is_user_port(49151))
  expect_false(is_user_port(1000))
  expect_false(is_user_port(50000))
})

test_that("build_http_url", {
  expect_identical(
    build_http_url("localhost", 9222, TRUE, "path", "query"),
    "https://localhost:9222/path?query"
  )
  expect_identical(
    build_http_url("127.0.0.1", 9222, FALSE, "path", "query"),
    "http://127.0.0.1:9222/path?query"
  )
})

test_that("parse_ws_url handles wrong parameter", {
  expect_null(parse_ws_url("http://localhost"))
  expect_null(parse_ws_url("ws://"))
  expect_null(parse_ws_url("ws://localhost"))
  expect_null(parse_ws_url("ws://localhost:9222/xxx/yyyy"))
  expect_null(parse_ws_url("ws://localhost:9222/xxx/yyyy/zzzz/aaaaaa"))
  expect_null(parse_ws_url("ws://localhost:9222/xxx/yyyy/zzzz"))
  expect_null(parse_ws_url("ws://localhost:9222/devtools/yyyy/zzzz"))
  expect_null(parse_ws_url("ws://localhost:9222/devtools/pages/zzzz"))
  expect_null(parse_ws_url("ws://localhost:9222/devtools/browsers/zzzz"))
})

test_that("parse_ws_url handles ws and wss url", {
  url <- "ws://localhost:9222/devtools/page/1676G76J"
  parsed <- parse_ws_url(url)
  expect_s3_class(parsed, "cdp_ws_url")
  expect_mapequal(parsed, list(
    host = "localhost",
    port = "9222",
    secure = FALSE,
    type = "page",
    id = "1676G76J"
  ))
  url <- "wss://localhost:9222/devtools/page/1676G76J"
  parsed <- parse_ws_url(url)
  expect_s3_class(parsed, "cdp_ws_url")
  expect_mapequal(parsed, list(
    host = "localhost",
    port = "9222",
    secure = TRUE,
    type = "page",
    id = "1676G76J"
  ))
})

test_that("build_ws_url handles only crrri ws url", {
  expect_error(build_ws_url(list(
    host = "localhost",
    port = "9222",
    secure = FALSE,
    type = "page",
    id = "1676G76J"
  )))
  parsed <- structure(list(
    host = "localhost",
    port = "9222",
    secure = FALSE,
    type = "page",
    id = "1676G76J"
  ), class = "cdp_ws_url")
  expect_identical(build_ws_url(parsed), "ws://localhost:9222/devtools/page/1676G76J")
  parsed <- structure(list(
    host = "localhost",
    port = "9222",
    secure = TRUE,
    type = "page",
    id = "1676G76J"
  ), class = "cdp_ws_url")
  expect_identical(build_ws_url(parsed), "wss://localhost:9222/devtools/page/1676G76J")
})

test_that("stop_or_reject handles async", {
  expect_error(stop_or_reject("error", FALSE), "^error$")
  expect_error(hold(stop_or_reject("error", TRUE)), "^error$")
})

test_that("check integerish accepts integer without L but not double", {
  expect_true(is_scalar_integerish(10))
  expect_true(is_scalar_integerish(10L))
  expect_false(is_scalar_integerish(10.5))
})


