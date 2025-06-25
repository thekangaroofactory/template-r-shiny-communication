

module_server <- function(id) {
  moduleServer(id, function(input, output, session) {

    # -- call nested module
    bar <- sub_module_server(id = "submodule")

    # -- return value
    bar

  })
}
