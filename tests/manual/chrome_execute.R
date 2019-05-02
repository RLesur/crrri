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

async_save_as_pdf <- function(url) {
  function(client) {
    Page <- client$Page

    Page$enable() %...>% {
      Page$navigate(url = url)
      Page$loadEventFired()
    } %...>% {
      Page$printToPDF()
    } %...>% {
      .$data %>%
        jsonlite::base64_dec() %>%
        writeBin(paste0(httr::parse_url(url)$hostname, ".pdf"))
    }
  }
}

save_as_pdf <- function(...) {
  list(...) %>%
    purrr::map(async_save_as_pdf) %>%
    chrome_execute(.list = .)
}

save_as_pdf("https://www.r-project.org/", "https://rstudio.com/")

maf = function(client) {1}

a= chrome_execute(maf)
