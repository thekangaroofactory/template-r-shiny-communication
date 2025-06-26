

# ------------------------------------------------------------------------------
# Server logic of the Shiny application
# ------------------------------------------------------------------------------

# -- Define server function
function(input, output, session) {

  # -- generate some data
  df <- data.frame(id = 1:3,
                   category = c("cat1", "cat2", "cat1"))

  # -- create input on server side
  output$filter_ui  <- renderUI(
    selectInput(inputId = "filter_1",
                label = "Select category",
                choices = unique(df$category)))

  # -- update input on server side
  # much easier to read
  updateSelectInput(inputId = "filter_2",
                    choices = unique(df$category))


}
