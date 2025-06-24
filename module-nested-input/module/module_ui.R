

# ------------------------------------------------------------------------------
# Shiny module UI
# ------------------------------------------------------------------------------

module_UI <- function(id) {

  # -- return
  tagList(

    # -- module input
    numericInput(inputId = NS(id, "numeric"),
                 label = "Module server input",
                 value = 0),

    # -- sub module ui
    sub_module_UI(NS(id, "submodule")))

}
