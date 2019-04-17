domain <- function(client, obj = list()) {
  stopifnot(
    length(names(obj)) == length(obj),
    is.character(unlist(obj))
  )

  Domain <- DomainGenerator()

  obj_names <- names(obj)

  set_active <- function(obj_name, command) {
    fun <- eval(parse(text = paste0('function(params = NULL, callback = NULL) {private$.client$send("', command, '", params = params, onresponse = callback)}')))

    Domain$set("public", obj_name, fun)
  }

  mapply(set_active, obj_name = obj_names, command = obj)
  return(Domain$new(client))
}

DomainGenerator <- function(){R6::R6Class(
 public = list(
   initialize = function(client = NULL) {
     private$.client <- client
   }
 ),
 private = list(
   .client = NULL
 )
)}

