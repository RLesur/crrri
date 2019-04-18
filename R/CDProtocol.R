CDProtocol <- R6::R6Class(
  "CDProtocol",
  public = list(
    initialize = function(url = "http://localhost:9222", local = TRUE) {
      if(isTRUE(local)) {
        protocol <- read_local_protocol()
      } else {
        protocol <- from_json(paste0(url, "/json/protocol"))
      }
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

from_json <- function(path) {
  jsonlite::fromJSON(
    path,
    simplifyVector = TRUE,
    simplifyDataFrame = FALSE,
    simplifyMatrix = FALSE
  )
}

read_local_protocol <- function() {
  js_protocol <- from_json(local_protocol_file("js"))
  browser_protocol <- from_json(local_protocol_file("browser"))
  browser_protocol$domains <- c(browser_protocol$domains, js_protocol$domains)
  browser_protocol
}

local_protocol_file <- function(file = c("js", "browser")) {
  file <- match.arg(file)
  system.file("protocol", paste0(file, "_protocol.json"), package = "crrri", mustWork = TRUE)
}

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
