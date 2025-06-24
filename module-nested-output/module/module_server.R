

module_server <- function(id) {
  moduleServer(id, function(input, output, session) {

    # -- call nested module
    sub_module_server(id = "submodule")

    # -- create output
    # note: it would normally contain dynamic text
    # (otherwise it's easier to directly hard code on ui side!)
    output$text <- renderText("This is a sample text from the module server")

    # -- check outputs
    # see ?outputOptions example
    outs <- outputOptions(output)
    cat("Outputs seen from the module server: ", paste(names(outs), collapse = " / ", "\n"))

  })
}
