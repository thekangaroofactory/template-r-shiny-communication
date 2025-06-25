

# ------------------------------------------------------------------------------
# Shiny module UI
# ------------------------------------------------------------------------------

module_1_UI <- function(id) {

  # -- namespace
  ns <- NS(id)

  # -- input
  numericInput(inputId = ns("numeric"),
               label = "Module1 server input",
               value = 0)

}
