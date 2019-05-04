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

test_that("get_formals_* methods return a list", {
  protocol <- CDProtocol$new()
  expect_is(protocol$get_formals_for_command("Page", "navigate"), "list")
  expect_is(protocol$get_formals_for_event("Page", "loadEventFired"), "list")
})

test_that("get_formals_* throws error if callback is present and returns correcly otherwise", {
  protocol <- CDProtocol$new()
  # create a dummy domain to add
  dummyDomain <- rlang::env(
    commands = rlang::env(
      dummy_cmd = rlang::env(
        parameters = rlang::env(
          callback = list(name = "callback", description = "callback")
        )),
      dummy_cmd2 = rlang::env(
        parameters = rlang::env(
          dummy_param2 = list(name = "dummy_param_opt",
                                 description = "dummy_desc option",
                                 optional = TRUE),
          dummy_param = list(name = "dummy_param", description = "dummy_dec")
        ))
    ),
    events = rlang::env(
      dummy_event = rlang::env(
        parameters = rlang::env(
          callback = list(name = "callback", description = "callback")
        )
      ),
      dummy_event2 = rlang::env(
        parameters = rlang::env(
          dummy_param = list(name = "dummy_param", description = "dummy_desc"),
          dummy_param2 = list(name = "dummy_param2",
                                 description = "dummy_desc option")
        )
      )
    ))
  # this is hacky but works to test and not depend on the json protocol
  rlang::env_bind(.env = protocol$.__enclos_env__$private$.protocol$domains,
                  dummyDomain = dummyDomain)
  expect_error(protocol$get_formals_for_command("dummyDomain", "dummy_cmd"), regexp = "callback")
  expect_error(protocol$get_formals_for_event("dummyDomain", "dummy_event"), regexp = "callback")
  expect_identical(
    protocol$get_formals_for_event("dummyDomain", "dummy_event2"),
    list(dummy_param = NULL, dummy_param2 = NULL, callback = NULL)
  )
  expect_identical(
    protocol$get_formals_for_command("dummyDomain", "dummy_cmd2"),
    list(dummy_param = rlang::sym(""), dummy_param2 = NULL, callback = NULL)
  )
})
