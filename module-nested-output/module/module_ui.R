

# ------------------------------------------------------------------------------
# Shiny module UI
# ------------------------------------------------------------------------------

module_UI <- function(id) {

  # -- return
  tagList(

    # -- module output
    textOutput(NS(id, "text")),

    # -- sub module ui
    sub_module_UI(NS(id, "submodule")))

}
