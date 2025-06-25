

# ------------------------------------------------------------------------------
# Server logic of the Shiny application
# ------------------------------------------------------------------------------

# -- Define server function
function(input, output, session) {

  # -- launch module server and assign return value
  foo <- module_1_server(id = "module")

  # -- launch module server and pass parameter
  module_2_server(id = "module", trigger = foo)

}
