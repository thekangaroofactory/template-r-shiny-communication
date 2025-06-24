

sub_module_server <- function(id) {
  moduleServer(id, function(input, output, session) {

    # -- observe input object
    observeEvent(input,
                 cat("Input(s) seen by the sub-module server:", paste(names(input), collapse = " / "), "\n"))

    # -- observe text input
    observeEvent(input$text,
                 cat("Sub-module input =", input$text,"\n"))

  })
}
