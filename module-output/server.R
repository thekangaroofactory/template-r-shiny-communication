

# ------------------------------------------------------------------------------
# Server logic of the Shiny application
# ------------------------------------------------------------------------------

# -- Define server function
function(input, output, session) {

  # -- launch module server
  module_server(id = "module")

  # -- check outputs
  outs <- outputOptions(output)
  cat("Outputs seen from the main server: ", paste(names(outs), collapse = " / ", "\n"))

}
