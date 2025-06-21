

# ------------------------------------------------------------------------------
# Module Server logic
# ------------------------------------------------------------------------------

module_server <- function(id) {
  moduleServer(id, function(input, output, session) {

    # -- create output
    output$text <- renderText("This is a sample text")

    # -- check outputs
    outs <- outputOptions(output)
    cat("Outputs seen from the module server: ", paste(names(outs), collapse = " / ", "\n"))

  })
}
