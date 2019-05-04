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

