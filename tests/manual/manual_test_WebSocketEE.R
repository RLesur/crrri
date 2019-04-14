devtools::load_all()

work_dir <- chr_new_data_dir()

chrome <- chr_launch(work_dir = work_dir, headless = TRUE)

ws_endpoint <- chr_get_ws_addr(debug_port = 9222)

ws <- WebSocketEE$new(ws_endpoint);print(1)
ws <- WebSocketEE$new("ws://ws_endpoint");print(1)
#ws$connect()
ws$on("event", function(data) {
  cat("Message from Chrome", data, "\n")
})
ws$emit("message", "test")

ws$close()
if(chrome$is_alive()) chrome$kill()
rm(list = ls())
gc()
