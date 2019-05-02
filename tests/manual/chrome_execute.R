devtools::load_all(".")
pdf_rproject <- function(client) {
  Page <- client$Page

  Page$enable() %...>% { # await enablement of the Page domain
    Page$navigate(url = "https://www.r-project.org/")
    Page$loadEventFired() # await the load event
  } %...>% {
    Page$printToPDF()
  } %...>% { # await PDF reception
    .$data %>% jsonlite::base64_dec() %>% writeBin("r_project.pdf")
    .$data
  }
}

pdf_rstudio <- function(client) {
  Page <- client$Page

  Page$enable() %...>% { # await enablement of the Page domain
    Page$navigate(url = "https://rstudio.com/")
    Page$loadEventFired() # await the load event
  } %...>% {
    Page$printToPDF()
  } %...>% { # await PDF reception
    .$data %>% jsonlite::base64_dec() %>% writeBin("rstudio.pdf")
    .$data
  }
}


chrome_execute(pdf_rproject, pdf_rstudio)
