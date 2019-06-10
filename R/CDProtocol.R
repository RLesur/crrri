#' @include http_methods.R
NULL

CDProtocol <- R6::R6Class(
  "CDProtocol",
  public = list(
    initialize = function(host = "localhost", port = 9222, secure = FALSE, local = TRUE) {
      protocol <- fetch_protocol(host = host, port = port, secure = secure, local = local)
      protocol <- add_names_to_protocol(protocol)
      protocol <- rlist2env(protocol)
      private$.protocol <- protocol
    },
    domain_description = function(domain) {
      desc <- rlang::env_get(env = private$.protocol$domains, nm = domain)$description
      if(is.null(desc)) {
        desc <- ""
      }
      desc
    },
    is_domain_experimental = function(domain) {
      isTRUE(private$.protocol$domains[[domain]]$experimental)
    },
    list_commands = function(domain) {
      private$.list_objects(domain, "commands")
    },
    get_formals_for_command = function(domain, command) {
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
    get_formals_for_event = function(domain, event) {
      params_env <- private$.protocol$domains[[domain]]$events[[event]]$parameters
      if(is.null(params_env)) {
        params_names <- character(0)
      } else {
        params_names <- ls(params_env)
      }
      # since we will add a callback argument, check that callback is not already used:
      stopifnot(!("callback" %in% params_names))
      # here is the main difference with get_formals_for_command:
      # in an event listener, all the parameters are optional
      # we can directly add the callback argument...
      params_names <- c(params_names, "callback")
      # ... and return the list
      res <- vector("list", length(params_names))
      names(res) <- params_names
      res
    },
    list_types = function(domain) {
      private$.list_objects(domain, "types")
    }
  ),
  active = list(
    domains = function() {
      ls(private$.protocol$domains)
    }
  ),
  private = list(
    .protocol = "environment",
    .list_objects = function(domain, cl) {
      specs <- rlang::env_get(env = private$.protocol$domains, nm = domain)[[cl]]
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

renv2list <- function(e, discard = NULL) {
  if(!rlang::is_environment(e)) return(e)
  names <- purrr::discard(ls(e), ~ .x %in% discard)
  names <- rlang::set_names(names)
  purrr::map(names, ~ renv2list(e[[.x]], discard))
}
