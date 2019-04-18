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
            fun <- function() {
              args <- utils::head(rlang::fn_fmls_names(), -1) # remove the callback argument
              params <- mget(args) # retrieve values
              # check for missing argument
              # when an argument is missing, its mode is name
              is_missing <- sapply(params, function(x) mode(x) == "name")
              if(any(is_missing)) {
                stop('argument "', names(is_missing[is_missing])[1], '" is missing, with no default value', call. = FALSE)
              }
              # remove argument with NULL
              params <- params[!sapply(params, is.null)]
              self$.__client__$send(method, params = params, onresponse = callback)
            }
            formals(fun) <- protocol$get_formals(domain, name)
            self[[name]] <- fun
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

