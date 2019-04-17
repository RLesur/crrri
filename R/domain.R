domain <- function(client, domain_name) {
  protocol <- client$.__protocol__
  methods_names <- names(c(
    protocol$list_commands(domain_name),
    protocol$list_events(domain_name),
    protocol$list_types(domain_name)
  ))

  Domain <- DomainGenerator()
  lapply(methods_names, function(name) Domain$set("public", name, NULL))
  return(Domain$new(client))
}

DomainGenerator <- function(){R6::R6Class(
 public = list(
   initialize = function(client, domain) {
     self$.__client__ <- client
   },
   .__client__ = NULL
 )
)}

