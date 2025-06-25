

# ------------------------------------------------------------------------------
# Server logic of the Shiny application
# ------------------------------------------------------------------------------

# -- Define server function
function(input, output, session) {

  # -- launch module servers
  module_1_server(id = "module1")
  module_2_server(id = "module2")

  # -- check outputs
  outs <- outputOptions(output)
  cat("Outputs seen from the main server: ", paste(names(outs), collapse = " / ", "\n"))

}
