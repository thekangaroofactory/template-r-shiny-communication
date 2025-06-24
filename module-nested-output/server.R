

# ------------------------------------------------------------------------------
# Server logic of the Shiny application
# ------------------------------------------------------------------------------

# -- Define server function
function(input, output, session) {

  # -- launch module server
  module_server(id = "module")

  # -- create output
  # note: it would normally contain dynamic text
  # (otherwise it's easier to directly hard code on ui side!)
  output$text <- renderText("This is a sample text from the main server")

  # -- check outputs
  # see ?outputOptions example
  outs <- outputOptions(output)
  cat("Outputs seen from the main server: ", paste(names(outs), collapse = " / ", "\n"))

}
