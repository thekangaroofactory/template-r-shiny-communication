

# ------------------------------------------------------------------------------
# Server logic of the Shiny application
# ------------------------------------------------------------------------------

# -- Define server function
function(input, output, session) {

  # -- launch module server
  module_server(id = "module")

  # -- observe input
  observeEvent(input,
               cat("Input(s) seen by the main server:", paste(names(input), collapse = " / "), "\n"))

}
