

sub_module_server <- function(id) {
  moduleServer(id, function(input, output, session) {

    # -- create output
    # note: it would normally contain dynamic text
    # (otherwise it's easier to directly hard code on ui side!)
    output$text <- renderText("This is a sample text from the sub-module server")

    # -- check outputs
    # see ?outputOptions example
    outs <- outputOptions(output)
    cat("Outputs seen from the submodule server: ", paste(names(outs), collapse = " / ", "\n"))

  })
}
