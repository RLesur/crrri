#' @include utils-pipe.R
NULL

domain <- function(client, domain_name) {
  protocol <- client$.__protocol__
  members_names <- names(c(
    protocol$list_commands(domain_name),
    protocol$list_events(domain_name),
    protocol$list_types(domain_name)
  ))

  CustomDomain <- R6::R6Class(
    domain_name,
    inherit = Domain,
    public = list(
      initialize = function(client, domain) {
        super$initialize(client, domain)
        protocol <- client$.__protocol__
        commands <- protocol$list_commands(domain)
        events <- protocol$list_events(domain)
        types <- protocol$list_types(domain)
        purrr::iwalk(commands, function(command, name) {
          self[[name]] <- private$.build_command(command, name)
        })
        purrr::iwalk(events, function(event, name) {
          self[[name]] <- private$.build_event_listener(event, name)
        })
      }
    )
  )

  purrr::walk(members_names, ~ CustomDomain$set("public", .x, NULL))
  CustomDomain$new(client, domain_name)
}

Domain <- R6::R6Class(
  "Domain",
  public = list(
    initialize = function(client, domain) {
      self$.__client__ <- client
      private$.domain_name <- domain
    },
    .__client__ = NULL
  ),
  private = list(
    .domain_name = NULL,
    .build_command = function(method_to_be_sent, name) {
      fun <- function() {
        params_to_be_sent <-
          rlang::fn_fmls_names() %>% # pick the fun arguments
          utils::head(-1) %>% # remove the callback argument
          rlang::env_get_list(nms = ., inherit = TRUE) %>% # retrieve values
          purrr::discard(~ purrr::is_null(.x)) # remove arguments identical to NULL

        self$.__client__$send(
            # since the function parameters are not controlled,
            # there might be some conflicts between CDP parameters and `method_to_be_sent`
            # Therefore, use get() to retrieve the `method_to_be_sent`
            get("method_to_be_sent", envir = parent.env(environment())),
            params = params_to_be_sent,
            onresponse = callback
          )
      }
      formals(fun) <- self$.__client__$.__protocol__$get_formals_for_command(private$.domain_name, name)
      fun
    },
    .build_event_listener = function(event_to_listen, name) {
      fun <- function() {
        res <- self$.__client__$on(event_to_listen, callback = callback)
        # if callback is NULL, a promise is returned
        # for events listeners, the value of the resolved promise is always a list of length 1
        # in order to facilitate the use of events listeners, we remove this level
        if(promises::is.promise(res)) {
          return(promises::then(res, ~ .x[[1]]))
        } else {
          res
        }
      }
      formals(fun) <- self$.__client__$.__protocol__$get_formals_for_event(private$.domain_name, name)
      fun
    }
  )
)

