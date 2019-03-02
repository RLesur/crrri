# from Rlesur/crrri@feature/build-on-cdp-session
# run with 604b202d

### Classic workflow promises -------------

devtools::load_all()

chrome <- chr_connect()
url = "https://www.rstudio.com"

configured <- chrome %>%
  Page.enable() %>%
  Network.enable() %>%
  Network.setRequestInterception(patterns = list(list(urlPattern="*")))

intercepted <-
  configured %>%
  Network.requestIntercepted() %...T>% {
    print("intercepted")
  }

configured %>%
  Page.navigate(url) %...!% {
  }

intercepted %...>% {
  chr_disconnect(chrome)
}

### Using Event Emitter No promises ------------------

# from Rlesur/crrri@feature/build-on-cdp-session
devtools::load_all()

# launch
work_dir <- chr_new_data_dir()
chrome <- chr_launch(work_dir = work_dir, headless = TRUE)


# get ws endpoint
ws_endpoint <- chr_get_ws_addr(debug_port = 9222, type = 'page')

# create the connexion to a page
page_session <- CDPSession$new(ws_endpoint)

# just check if connexion ready - To wrap in a function
repeat {
  if (page_session$is_ready()) break
}

url = "https://www.rstudio.com"


page_session$once("run", ~ page_session$sendCommand("Page.enable"))
page_session$once("Page.enable", ~ page_session$sendCommand("Network.enable"))
page_session$once("Network.enable",
                  # configure interception
                  ~ page_session$sendCommand(
                    "Network.setRequestInterception",
                    params = list(patterns = list(list(urlPattern="*")))))
page_session$once("Network.setRequestInterception",
                  # Go to the url
                  ~ page_session$sendCommand("Page.navigate", params = list(url = url)))
# Get all the interception
page_session$on("Network.requestIntercepted",
                  ~ {
                    print("intercepted")
                    intercepted <<- TRUE
                  })

# launch the workflow
intercepted <- FALSE
page_session$emit("run")

while(!intercepted) {
  later::run_now()
}

page_session$close()
if(chrome$is_alive()) chrome$kill()
rm(list = ls())

## Event Emitter Pipe workflow ----------------

devtools::load_all()

# launch
work_dir <- chr_new_data_dir()
chrome <- chr_launch(work_dir = work_dir, headless = TRUE)

# get ws endpoint
ws_endpoint <- chr_get_ws_addr(debug_port = 9222, type = 'page')

# create the connexion to a page
page_session <- CDPSession$new(ws_endpoint)

# just check if connexion ready - To wrap in a function
repeat {
  if (page_session$is_ready()) break
}

url <- "https://www.r-project.org/"

# Object required for the piped workflow
session <- list(CDPSession = page_session)

session %>%
  sendToSession("Page.enable", listener = "run") %>%
  sendToSession("Network.enable") %>%
  sendToSession("Network.setRequestInterception",
                params = list(patterns = list(list(urlPattern="*")))) %>%
  sendToSession("Page.navigate", params = list(url = url)) %>%
  listenTo("Network.requestIntercepted",
           callback = ~ {
             print("intercepted")
             intercepted <<- TRUE
           })

intercepted <- FALSE
page_session$emit("run")

while(!intercepted) {
  later::run_now()
}

page_session$close()
if(chrome$is_alive()) chrome$kill()
rm(list = ls())
