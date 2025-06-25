

# ------------------------------------------------------------------------------
# Module Server logic
# ------------------------------------------------------------------------------

module_2_server <- function(id) {
  moduleServer(id, function(input, output, session) {

    # -- declare output
    output$text_2 <- renderText(paste("Some text from", id))

    # -- check outputs
    outs <- outputOptions(output)
    cat("Outputs seen from the module2 server: ", paste(names(outs), collapse = " / ", "\n"))

  })
}
