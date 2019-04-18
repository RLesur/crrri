#!/usr/bin/env Rscript
update_protocol <- function() {
  writeLines(readLines("https://raw.githubusercontent.com/ChromeDevTools/devtools-protocol/master/json/js_protocol.json"),
             here::here("inst/protocol/js_protocol.json"))
  writeLines(readLines("https://raw.githubusercontent.com/ChromeDevTools/devtools-protocol/master/json/browser_protocol.json"),
             here::here("inst/protocol/browser_protocol.json"))
}

update_protocol()
