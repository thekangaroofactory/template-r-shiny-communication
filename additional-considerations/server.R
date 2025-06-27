

# ------------------------------------------------------------------------------
# Server logic of the Shiny application
# ------------------------------------------------------------------------------

# -- Define server function
function(input, output, session) {

  # -- create reactive value
  foo <- reactiveVal(data.frame(id = 1:3, name = paste0("name_", 1:3)))

  # -- launch module server and pass parameter
  module_1_server(id = "module", trigger = foo)

  # -- observe foo
  observe(
    if(is.null(foo()))
      cat("Parameter has been overwritten with NULL! \n"))



  # -- launch module server and assign return value
  bar <- module_2_server(id = "module")

  # -- observe bar
  observeEvent(bar(), bar(NULL))

}
