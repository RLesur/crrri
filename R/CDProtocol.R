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
        params_names <- purrr::set_names(ls(params_env))
      }
      # since we will add a callback argument, check that callback is not already used:
      stopifnot(!("callback" %in% params_names))
      params_optional <- purrr::map_lgl(params_names,  ~ isTRUE(params_env[[.x]]$optional))
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
  list2env(purrr::map(.l, rlist2env), parent = emptyenv())
}

add_names_to_protocol <- function(protocol) {
  protocol$domains <- purrr::map(protocol$domains, add_names_to_domain)
  names(protocol$domains) <- purrr::map_chr(protocol$domains, "domain")
  protocol
}

add_names_to_domain <- function(domain) {
  if(!is.null(domain$dependencies)) {
    domain$dependencies <- unlist(domain$dependencies)
  }
  if(!is.null(domain$types)) {
    domain$types <- purrr::map(domain$types, add_names_to_type)
    names(domain$types) <- purrr::map_chr(domain$types, "id")
  }
  if(!is.null(domain$commands)) {
    domain$commands <- purrr::map(domain$commands, add_names_to_method)
    names(domain$commands) <- purrr::map_chr(domain$commands, "name")
  }
  if(!is.null(domain$events)) {
    domain$events <- purrr::map(domain$events, add_names_to_method)
    names(domain$events) <- purrr::map_chr(domain$events, "name")
  }
  domain
}

add_names_to_type <- function(type) {
  if(!is.null(type$properties)) {
    names(type$properties) <- purrr::map_chr(type$properties, "name")
  }
  type
}

add_names_to_method <- function(method) {
  if(!is.null(method$parameters)) {
    names(method$parameters) <- purrr::map_chr(method$parameters, "name")
  }
  if(!is.null(method$returns)) {
    names(method$returns) <- purrr::map_chr(method$returns, "name")
  }
  method
}
