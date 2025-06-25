

# ------------------------------------------------------------------------------
# Server logic of the Shiny application
# ------------------------------------------------------------------------------

# -- Define server function
function(input, output, session) {

  # -- launch module server
  foo <- module_server(id = "module")

  # -- define output
  output$box <- renderUI(value_box(title = "From main server",
                                   value = foo()))

}
