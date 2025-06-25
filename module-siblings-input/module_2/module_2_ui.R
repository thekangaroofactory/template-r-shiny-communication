

# ------------------------------------------------------------------------------
# Shiny module UI
# ------------------------------------------------------------------------------

module_2_UI <- function(id) {

  # -- namespace
  ns <- NS(id)

  # -- input
  textInput(inputId = ns("text"),
            label = "Module2 server input",
            value = "")

}
