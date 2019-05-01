context("test-CDProtocol")

test_that("rlist2env transform nested list to nested env", {
  .l <- list(a = list(b = 2), c = list(d = 3))
  .env <- rlang::env(rlang::empty_env(),
                     a = rlang::env(rlang::empty_env(), b = 2),
                     c = rlang::env(rlang::empty_env(), d = 3))
  expect_equal(rlist2env(.l), .env)
})

test_that("renv2list transform nested environment to nested list", {
  .l <- list(a = list(b = 2), c = list(d = 3))
  .env <- rlist2env(.l)
  .l2 <- renv2list(.env)
  expect_identical(.l, .l2)
})

test_that("renv2list discard argument remove any object that is referenced by one of these names", {
  .l <- list(a = list(b = 2, remove_me = "a"), c = list(d = 3, remove_me_too = "b"), remove_me = 4)
  .exptd <- list(a = list(b = 2), c = list(d = 3))
  .env <- rlist2env(.l)
  .l2 <- renv2list(.env, discard = c("remove_me", "remove_me_too"))
  expect_identical(.l2, .exptd)
})
