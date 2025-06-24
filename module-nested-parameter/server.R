

# ------------------------------------------------------------------------------
# Server logic of the Shiny application
# ------------------------------------------------------------------------------

# -- Define server function
function(input, output, session) {

  # -- declare reactive (to pass on to the module)
  # input value is not altered
  foo <- reactive({
    cat("Server input update / value =", input$numeric, "\n")
    input$numeric})

  # -- launch module server
  module_server(id = "module", trigger = foo)

}
