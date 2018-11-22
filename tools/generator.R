js_protocol <- jsonlite::read_json("./tools/js_protocol.json")
browser_protocol <- jsonlite::read_json("./tools/browser_protocol.json")

types <- c(string = "A character string. ",
           boolean = "A logical. ",
           integer = "An integer. ",
           array = "A list of ",
           number = "A numeric. ")

is_param_optional <- function(parameter) {
  isTRUE(parameter$optional)
}

is_cmd_deprecated <- function(command) {
  isTRUE(command$deprecated)
}

sanitize_help <- function(text) {
  gsub("\\n", "\n#'        ", text)
}

# Build command -----------------------------------------------------------
build_command_signature <- function(command) {
  par_names <- c("promise", purrr::map_chr(command$parameters, "name"))
  optionals <- c(FALSE, purrr::map_lgl(command$parameters, is_param_optional))
  paste0("function(",
         paste(paste0(par_names,
                      ifelse(optionals, " = NULL", "")
         ), collapse = ", "),
         ", awaitResult = TRUE)")
}

build_command_parameter_help <- function(parameter) {
  declaration <- paste0(
    "#' @param ", parameter$name, " ",
    if (isTRUE(parameter$deprecated)) "Deprecated. ",
    if (isTRUE(parameter$experimental)) "Experimental. ",
    if (isTRUE(parameter$optional)) "Optional. ",
    types[parameter$type],
    if (!is.null(parameter$items)) paste0(parameter$items, ". "),
    if (!is.null(parameter[["$ref"]])) paste0("A ", parameter[["$ref"]], ". ")
  )
  details <- paste(
    parameter$description,
    if (!is.null(parameter$enum))
      paste0("Accepted values: ", paste(parameter$enum, collapse = ", "), ".")
  )
  text <- paste0(declaration, if (length(details) > 0) "\n", details)
  sanitize_help(text)
}

build_command_help <- function(domain_name, command) {
  title <- paste0("#' Send the command ", paste(domain_name, command$name, sep = "."), "\n#' ")
  description <- paste0("#' ", command$description)
  description <- paste0(sanitize_help(description), "\n#' ")
  params <- c("#' @param promise An asynchronous result.",
              purrr::map_chr(command$parameters, build_command_parameter_help),
              "#' @param awaitResult Await for the command result?"
  )
  return_field <- paste0(
    "#' ",
    "\n#' @return An async value of class `promise`.",
    "\n#'         The value and the completion of the promise differ according to the value of `awaitResult`.",
    "\n#'         Its value is a named list of two elements: `ws` (the websocket connexion) and `result`.",
    "\n#'         When `awaitResult` is `TRUE`, the promise is fulfilled once the result of the command is received. In this case,",
    if (length(command$returns) == 0) "\n#'         `result` is a void named list."
    else sprintf("\n#'         `result` is a named list of length %i.", length(command$returns)),
    "\n#'         When `awaitResult` is `FALSE`, the promise is fulfilled once the command is sent:",
    "\n#'         `result` is equal to the previous result (`promise$result`).",
    "\n#'         In both cases, you can chain this promise with another command or event listener."
  )
  paste0(c(title, description, params, return_field, "#' @export"), collapse = "\n")
}

generate_command <- function(command, domain_name = NULL) {
  r2help <- build_command_help(domain_name, command)
  body <- paste0(paste(domain_name, command$name, sep = "."), " <- ", build_command_signature(command), " {\n",
                sprintf("  method <- '%s.%s'\n", domain_name, command$name),
                "  args <- head(rlang::fn_fmls_names(), -1)\n",
                "  args <- args[!sapply(mget(args), is.null)]\n",
                "  params <- mget(args)\n",
                "  params <- if (length(params) > 1) params[2:length(params)] else NULL\n",
                "  send(promise, method, params, awaitResult)\n",
                "}\n")
  paste(r2help, body, sep = "\n")
}

generate_commands_source_code <- function(domain) {
  deprecated <- purrr::map_lgl(domain$commands, is_cmd_deprecated)
  commands <- domain$commands[!deprecated]
  file_content <- paste0(c(
    "# DO NOT EDIT BY HAND\n#' @include send.R\nNULL",
    purrr::map_chr(commands, generate_command, domain_name = domain$domain)
  ), collapse = "\n\n")
  cat(file_content, file = paste0("R/", domain$domain, "_commands.R"))
}

purrr::walk(js_protocol$domains, generate_commands_source_code)
purrr::walk(browser_protocol$domains, generate_commands_source_code)

# Build event listener ----------------------------------------------------
build_event_parameter_help <- function(parameter) {
  declaration <- paste0(
    "#' @param ", parameter$name, " ",
    if (isTRUE(parameter$deprecated)) "Deprecated. ",
    if (isTRUE(parameter$experimental)) "Experimental. ",
    types[parameter$type],
    if (!is.null(parameter$items)) paste0(parameter$items, ". "),
    if (!is.null(parameter[["$ref"]])) paste0("A ", parameter[["$ref"]], ". ")
  )
  details <- paste(
    parameter$description,
    paste0("Accepted values: ", paste(c(paste0("`~ .res$", parameter$name, "` (to refer to the previous result)"), parameter$enum), collapse = ", "), ".")
  )
  text <- paste0(declaration, if (length(details) > 0) "\n", details)
  sanitize_help(text)
}

build_event_help <- function(domain_name, event) {
  title <- paste0("#' Await the event ", paste(domain_name, event$name, sep = "."), " or create a callback", "\n#' ")
  description <- paste0("#' ", event$description)
  description <- paste0(sanitize_help(description), "\n#' ")
  params <- c("#' @param promise An asynchronous result object.",
              purrr::map_chr(event$parameters, build_event_parameter_help),
              "#' @param .callback A callback function taking one argument. The object passed to",
              "#'        this function is the message received from Chrome: this is a named list",
              paste0("#'        with an element `method` (that is equal to `\"", event$name, "\"`)"),
              "#'        and an element `params` which is a named list.",
              if (is.null(event$parameters)) "#'        For this event, `params` is void."
              else c(
                "#'        The `params` list is composed of",
                paste0("#'        the following element(s): ",
                       paste0("`", purrr::map_chr(event$parameters, "name"), "`",
                              ifelse(purrr::map_lgl(event$parameters, is_param_optional), " (optional) ", ""),
                              collapse = ", "
                       ),
                       "."
                )
              )
  )
  return_field <- paste0(
    "#' ",
    "\n#' @return An async value of class `promise`.",
    "\n#'         The value and the completion of the promise differ according to the use of a callback function.",
    "\n#'         When `.callback` is `NULL`, the promise is fulfilled when the event is received.",
    "\n#'         Its value is a named list of two elements: `ws` (the websocket connexion) and `result`.",
    "\n#'         `result` is a named list: its elements are the parameters sended by Chrome. ",
    "\n#'         You can chain this promise with another command or event listener.",
    "\n#'         When `.callback` is not `NULL`, the promise is fulfilled as soon as the callback is created; the value",
    "\n#'         is a function without any argument that can be called to cancel the callback. When you use the",
    "\n#'         `.callback` argument, you cannot send the result to any other command or event listener."
  )
  paste0(c(title, "#' **Event description**:  ", description, params, return_field, "#' @export"), collapse = "\n")
}


build_event_signature <- function(event) {
  par_names <- purrr::map_chr(event$parameters, "name")
  paste0("function(promise, ", if (length(par_names) > 0) paste0(paste(paste0(par_names, " = NULL"), collapse = ", "), ", "), ".callback = NULL)")
}

generate_event <- function(event, domain_name = NULL) {
  r2help <- build_event_help(domain_name, event)
  body <- paste0(paste(domain_name, event$name, sep = "."), " <- ", build_event_signature(event), " {\n",
                 sprintf("  method <- '%s.%s'\n", domain_name, event$name),
                 "  args <- head(rlang::fn_fmls_names(), -1)\n",
                 "  args <- args[!sapply(mget(args), is.null)]\n",
                 "  params <- mget(args)\n",
                 "  params <- if (length(params) > 1) params[2:length(params)] else NULL\n",
                 "  listen(promise, method, params, .callback)\n",
                 "}\n")
  paste(r2help, body, sep = "\n")
}

generate_events_source_code <- function(domain) {
  events <- domain$events
  if (is.null(events)) return()
  file_content <- paste0(c(
    "# DO NOT EDIT BY HAND\n#' @include send.R\nNULL",
    purrr::map_chr(events, generate_event, domain_name = domain$domain)
  ), collapse = "\n\n")
  cat(file_content, file = paste0("R/", domain$domain, "_events.R"))
}

purrr::walk(js_protocol$domains, generate_events_source_code)
purrr::walk(browser_protocol$domains, generate_events_source_code)

# TODO detail the return object resulting of a command
# TODO check the remote protocol (in send)


