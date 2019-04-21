#' @include utils-pipe.R
NULL

domain <- function(client, domain_name) {
  protocol <- client$.__protocol__
  methods_names <- names(c(
    protocol$list_commands(domain_name),
    protocol$list_events(domain_name),
    protocol$list_types(domain_name)
  ))

  CustomDomain <- R6::R6Class(
    domain_name,
    inherit = Domain,
    public = list(
      initialize = function(client, domain) {
        self$.__client__ <- client
        protocol <- client$.__protocol__
        commands <- protocol$list_commands(domain)
        events <- protocol$list_events(domain)
        types <- protocol$list_types(domain)
        mapply(
          function(name, method_to_be_sent) {
            fun <- function() {
              rlang::fn_fmls_names() %>% # pick the fun arguments
                utils::head(-1) %>% # remove the callback argument
                rlang::env_get_list(nms = ., inherit = TRUE) %>% # retrieve values
                purrr::discard(~ purrr::is_null(.x)) %>% # remove arguments identical to NULL
                self$.__client__$send(
                  # since the function parameters are not controlled,
                  # there might be some conflicts between CDP parameters and `method_to_be_sent`
                  # Therefore, use get() to retrieve the `method_to_be_sent`
                  get("method_to_be_sent", envir = parent.env(environment())),
                  params = .,
                  onresponse = callback
                )
            }
            formals(fun) <- protocol$get_formals(domain, name)
            self[[name]] <- fun
          },
          name = names(commands),
          method_to_be_sent = commands
        )
        mapply(
          function(name, event) {
            self[[name]] <- function(callback = NULL) {
              self$.__client__$on(event, callback = callback)
            }
          },
          name = names(events),
          event = events
        )
      }
    )
  )

  lapply(methods_names, function(name) CustomDomain$set("public", name, NULL))
  return(CustomDomain$new(client, domain_name))
}

Domain <- R6::R6Class(
  "Domain",
  public = list(
    .__client__ = NULL
  )
)

