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
          function(name, method) {
            self[[name]] <- function(params = NULL, callback = NULL) {
              self$.__client__$send(method, params = params, onresponse = callback)
            }
          },
          name = names(commands),
          method = commands
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

