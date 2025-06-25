

# ------------------------------------------------------------------------------
# Server logic of the Shiny application
# ------------------------------------------------------------------------------

# -- Define server function
function(input, output, session) {

  # -- launch module server
  module_1_server(id = "module1")
  module_2_server(id = "module2")

  observeEvent(input,
               cat("Input(s) seen by the main server:", paste(names(input), collapse = " / "), "\n"))

}
