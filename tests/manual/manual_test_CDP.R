# CDP ---------------------------------------------------------------------
devtools::load_all()

work_dir <- chr_new_data_dir()

chrome <- chr_launch(work_dir = work_dir, headless = TRUE)

ws_endpoint <- chr_get_ws_addr(debug_port = 9222)

client <- CDP(ws_endpoint)

client$on("connect", function(x) cat("coucou\n"))

client$connect()
client$readyState()


a = client$send("Runtime.enable")

b = client$send("rr")

client$close()
if(chrome$is_alive()) chrome$kill()
rm(list = ls())
gc()
