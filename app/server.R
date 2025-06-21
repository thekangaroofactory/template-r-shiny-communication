

# ------------------------------------------------------------------------------
# Server logic of the Shiny application
# ------------------------------------------------------------------------------

# -- Define server function
function(input, output, session) {

  # -- declare trigger
  my_trigger <- reactiveVal(NULL)

  # -- launch module server
  module <- module_server(id = "module", trigger = my_trigger)


  # ----------------------------------------------------------------------------
  # Display the data
  # ----------------------------------------------------------------------------

  output$table <- DT::renderDT(module$data())


  # ----------------------------------------------------------------------------
  # Hit module
  # ----------------------------------------------------------------------------

  # -- declare actionLink
  # From the server so that we can reuse the namespace returned by the module
  output$link <- renderUI(
    actionLink(inputId = "dummy",
               label = "Action!",
               onclick = sprintf('Shiny.setInputValue(\"%s\", this.id, {priority: \"event\"})',
                                 module$ns("action"))))


  # -- observe button
  observeEvent(input$action_btn,
               my_trigger(paste0("my_trigger_", input$action_btn)))



  # ----------------------------------------------------------------------------
  # Call function
  # ----------------------------------------------------------------------------

  # -- observe actionLink
  observeEvent(input$action_link,

               # -- call the function on the module data
               module$data |>
                 alter_element())

  # -- observe button
  observeEvent(input$alter,

               # -- call the function on the module data
               module$data |>
                 alter_element())

}
