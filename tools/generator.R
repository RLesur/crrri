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

# Build command -----------------------------------------------------------
build_command_signature <- function(command) {
  par_names <- c("promise", purrr::map_chr(command$parameters, "name"))
  optionals <- c(FALSE, purrr::map_lgl(command$parameters, is_param_optional))
  paste0("function(",
         paste(paste0(par_names,
                      ifelse(optionals, " = NULL", "")
         ), collapse = ", "),
         ")")
}

sanitize_help <- function(text) {
  gsub("\\n", "\n#'        ", text)
}

build_parameter_help <- function(parameter) {
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
  params <- c("#' @param promise An aynchronous result object.",
              purrr::map_chr(command$parameters, build_parameter_help)
  )
  return_field <- paste0(
    "#' ",
    "\n#' @return A promise (following the definition of the promises package).",
    sprintf("\n#'         The value of the fulfilled promise is a named list of length %i.", length(command$returns))
  )
  paste0(c(title, description, params, return_field, "#' @export"), collapse = "\n")
}

generate_command <- function(command, domain_name = NULL) {
  r2help <- build_command_help(domain_name, command)
  body <- paste0(paste(domain_name, command$name, sep = "."), " <- ", build_command_signature(command), " {\n",
                sprintf("  method <- '%s.%s'\n", domain_name, command$name),
                "  args <- rlang::fn_fmls_names()\n",
                "  args <- args[!sapply(mget(args), is.null)]\n",
                "  params <- mget(args)\n",
                "  names(params) <- args\n",
                "  params <- if (length(params) > 1) params[2:length(params)] else NULL\n",
                "  send(promise, method, params)\n",
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

build_event_signature <- function(event) {
  par_names <- c("promise", purrr::map_chr(command$parameters, "name"))
  optionals <- c(FALSE, purrr::map_lgl(command$parameters, is_param_optional))
  paste0("function(",
         paste(paste0(par_names,
                      ifelse(optionals, " = NULL", "")
         ), collapse = ", "),
         ")")
}

# TODO detail returned objects
# TODO check the remote protocol (in send)
