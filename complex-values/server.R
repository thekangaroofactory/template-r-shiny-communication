

# ------------------------------------------------------------------------------
# Server logic of the Shiny application
# ------------------------------------------------------------------------------

# -- Define server function
function(input, output, session) {

  # -- launch module server
  res <- module_server(id = "module", trigger = list(button = reactive(input$button),
                                                     value_1 = reactive(input$numeric_1),
                                                     value_2 = reactive(input$numeric_2)))

  # -- observe module server return value
  observe({
    cat("Count", res$count(), "\n")
    cat("Sum =", res$stats$sum(), "\n")
    cat("Mean =", res$stats$mean(), "\n")
  })

}
