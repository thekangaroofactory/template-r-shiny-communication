

module_server <- function(id) {
  moduleServer(id, function(input, output, session) {

    # -- call nested module
    sub_module_server(id = "submodule")

    # -- observe input object
    observeEvent(input,
                 cat("Input(s) seen by the module server:", paste(names(input), collapse = " / "), "\n"))

    # -- observe numeric input
    observeEvent(input$numeric,
                 cat("Module input =", input$numeric,"\n"))

  })
}
