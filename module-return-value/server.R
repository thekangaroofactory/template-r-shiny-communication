

# ------------------------------------------------------------------------------
# Server logic of the Shiny application
# ------------------------------------------------------------------------------

# -- Define server function
function(input, output, session) {

  # -- launch module server & assign the return value
  rv <- module_server(id = "module")

  # -- listen to the return value
  observeEvent(rv(),
               cat("Module return value =", rv(), "\n"))

}
