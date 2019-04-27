#' @include http_methods.R
NULL

CDProtocol <- R6::R6Class(
  "CDProtocol",
  public = list(
    initialize = function(host = "localhost", port = 9222, secure = FALSE, local = TRUE) {
      protocol <- fetch_protocol(host = host, port = port, secure = secure, local = local)
      protocol <- add_names_to_protocol(protocol)
      protocol <- rlist2env(protocol)
      self$domains <- ls(protocol$domains)
      private$.protocol <- protocol
    },
    domain_description = function(domain) {
      get(domain, private$.protocol$domains)$description
    },
    list_commands = function(domain) {
      private$.list_objects(domain, "commands")
    },
    get_formals = function(domain, command) {
      params_env <- private$.protocol$domains[[domain]]$commands[[command]]$parameters
      if(is.null(params_env)) {
        params_names <- character(0)
      } else {
        params_names <- ls(params_env)
      }
      # since we will add a callback argument, check that callback is not already used:
      stopifnot(!("callback" %in% params_names))
      params_optional <- sapply(params_names, function(name) isTRUE(params_env[[name]]$optional))
      if(length(params_optional) > 0) {
        params_optional <- sort(params_optional) # get the required params first
      }
      params_optional <- c(params_optional, callback = TRUE)
      # build the pairlist string:
      text <- paste0(
        "alist(",
        paste(names(params_optional), ifelse(params_optional, "NULL", ""), sep = " = ", collapse = ", "),
        ")"
      )
      # return the pairlist:
      eval(parse(text = text))
    },
    list_events = function(domain) {
      private$.list_objects(domain, "events")
    },
    list_types = function(domain) {
      private$.list_objects(domain, "types")
    },
    domains = NULL
  ),
  private = list(
    .protocol = "environment",
    .list_objects = function(domain, cl) {
      specs <- get(domain, private$.protocol$domains)[[cl]]
      if(is.null(specs)) return(list())
      obj_names <- ls(specs)
      l <- as.list(paste(domain, obj_names, sep = "."))
      names(l) <- obj_names
      l
    }
  )
)

rlist2env <- function(.l) {
  if (!is.list(.l)) return(.l)
  list2env(lapply(.l, rlist2env), parent = emptyenv())
}

add_names_to_protocol <- function(protocol) {
  protocol$domains <- lapply(protocol$domains, add_names_to_domain)
  names(protocol$domains) <- sapply(protocol$domains, function(x) x$domain)
  protocol
}

add_names_to_domain <- function(domain) {
  if(!is.null(domain$dependencies)) {
    domain$dependencies <- unlist(domain$dependencies)
  }
  if(!is.null(domain$types)) {
    domain$types <- lapply(domain$types, add_names_to_type)
    names(domain$types) <- sapply(domain$types, function(x) x$id)
  }
  if(!is.null(domain$commands)) {
    domain$commands <- lapply(domain$commands, add_names_to_method)
    names(domain$commands) <- get_names(domain$commands)
  }
  if(!is.null(domain$events)) {
    domain$events <- lapply(domain$events, add_names_to_method)
    names(domain$events) <- get_names(domain$events)
  }
  domain
}

add_names_to_type <- function(type) {
  if(!is.null(type$properties)) {
    names(type$properties) <- get_names(type$properties)
  }
  type
}

add_names_to_method <- function(method) {
  if(!is.null(method$parameters)) {
    names(method$parameters) <- get_names(method$parameters)
  }
  if(!is.null(method$returns)) {
    names(method$returns) <- get_names(method$returns)
  }
  method
}

get_names <- function(l) {
  sapply(l, function(x) x$name)
}
