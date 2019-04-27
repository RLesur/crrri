context("test-CDProtocol")

test_that("rlist2env transform nested list to nested env", {
  .l <- list(a = list(b = 2), c = list(d = 3))
  .env <- rlang::env(rlang::empty_env(),
                     a = rlang::env(rlang::empty_env(), b = 2),
                     c = rlang::env(rlang::empty_env(), d = 3))
  expect_equal(rlist2env(.l), .env)
})
