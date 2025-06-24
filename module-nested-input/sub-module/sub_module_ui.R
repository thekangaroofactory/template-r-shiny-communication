

# ------------------------------------------------------------------------------
# Shiny sub module UI
# ------------------------------------------------------------------------------

sub_module_UI <- function(id) {

  # -- declare input
  textInput(inputId = NS(id, "text"),
            label = "Sub module server input",
            value = "")

}
