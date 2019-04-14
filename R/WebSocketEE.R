#' @include EventEmitter.R
NULL

WebSocketEE <- R6::R6Class(
  "WebSocketEE",
  inherit = EventEmitter,
  public = list(
    initialize = function(ws_url, onconnect = NULL, onerror = NULL) {
      "!DEBUG Configuring the websocket connexion..."
      if(is.null(onconnect)) {
        repl <- TRUE
        rm_onconnect <- NULL
        rm_onerror <- NULL
        rm_onconnect <- self$once("connect", function(client) {
          rm_onconnect()
          rm_onerror()
          private$.ready <- TRUE
        })
        rm_onerror <- self$once("error", function(reason) {
          rm_onconnect()
          rm_onerror()
          private$.ready <- TRUE
          stop(reason)
        })
      } else {
        repl <- FALSE
        self$once("connect", onconnect)
        if(!is.null(onerror)) {
          self$once("error", onerror)
        }
      }
      private$.ready <- FALSE
      ws <- websocket::WebSocket$new(ws_url, autoConnect = FALSE)
      ws$onOpen(function(event) {
        self$emit("connect", client = self)
        "!DEBUG ...R succesfully connected via websocket connexion."
      })
      ws$onMessage(function(event) {
        "!DEBUG Got message from websocket connexion: '`event$data`'"
        self$emit("event", data = event$data)
      })
      ws$onClose(function(event) {
        self$emit("disconnect", reason = event$reason, code = event$code)
        "!DEBUG R disconnected-Websocket connexion closed with code `event$code`"
        "!DEBUG and reason `event$reason`."
        # later::later(~ chr_close(chr_process, work_dir), delay = 0.2)
      })
      ws$onError(function(event) {
        self$emit("error", reason = event$message)
        "!DEBUG Client failed to connect: `event$message`."
        # later::later(~ chr_close(chr_process, work_dir), delay = 0.2)
      })
      self$on("message", function(data = "") {
        private$.websocket$send(data)
        "!DEBUG Message '`data`' sent."
        invisible(self)
      })
      reg.finalizer(ws, function(ws) { ws$close() })
      "!DEBUG ...websocket connexion configured."
      private$.websocket <- ws
      private$.websocket$connect()
      if(repl) {
        while(!private$.ready) {
          later::run_now()
        }
      }
    },
    connect = function() {
      private$.websocket$connect()
    },
    close = function() {
      private$.websocket$close()
    }
  ),
  private = list(
    .ready = "logical",
    .websocket = "WebSocket"
  )
)
