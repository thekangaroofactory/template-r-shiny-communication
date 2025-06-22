

# ------------------------------------------------------------------------------
# Server logic of the Shiny application
# ------------------------------------------------------------------------------

# -- Define server function
function(input, output, session) {

  # -- declare reactive object (listening to the actionButton)
  hit_module <- reactive(input$button)

  # -- launch module server
  module_server(id = "module", trigger = hit_module, debug = TRUE)

}
