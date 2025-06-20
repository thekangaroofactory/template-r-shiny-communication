

# ------------------------------------------------------------------------------
# Shiny module UI
# ------------------------------------------------------------------------------

module_UI <- function(id) {

  # -- namespace
  ns <- NS(id)

  # -- text input
  textInput(inputId = ns("text"),
            label = "Module server input",
            value = "")

}
