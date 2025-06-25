

# ------------------------------------------------------------------------------
# Module Server logic
# ------------------------------------------------------------------------------

module_1_server <- function(id) {
  moduleServer(id, function(input, output, session) {

    # -- declare output
    output$text_1 <- renderText(paste("Some text from", id))

    outs <- outputOptions(output)
    cat("Outputs seen from the module1 server: ", paste(names(outs), collapse = " / ", "\n"))


  })
}
