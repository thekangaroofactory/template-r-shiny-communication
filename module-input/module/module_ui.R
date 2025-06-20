

# ------------------------------------------------------------------------------
# Shiny module UI
# ------------------------------------------------------------------------------

module_UI <- function(id) {

  # -- namespace
  ns <- NS(id)

  # -- input
  numericInput(inputId = ns("numeric"),
               label = "Module server input",
               value = 0)

}
