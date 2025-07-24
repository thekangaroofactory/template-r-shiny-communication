

# ------------------------------------------------------------------------------
# Server logic of the Shiny application
# ------------------------------------------------------------------------------

# -- Define server function
function(input, output, session) {

  # -- dataset size
  nb_row <- 1000

  # -- create sample data
  data <- reactiveVal(data.frame(id = 1:nb_row,
                                 name = paste0("name_", 1:nb_row),
                                 date = sample(seq(as.Date('2020/01/01'), as.Date('2025/01/01'), by = "day"), nb_row),
                                 category = LETTERS[round(runif(nb_row, 1, 2), digits = 0)],
                                 value = runif(nb_row, min = 0, max = 100)))


  # ----------------------------------------------------------------------------
  # observe inputs
  # ----------------------------------------------------------------------------

  date_range <- reactive(input$date_filter)


  # ----------------------------------------------------------------------------
  # call module server
  # ----------------------------------------------------------------------------

  stats <- module_server(id = "module",
                         dataset = data,
                         filters = list(date = date_range,
                                        category = reactive(input$category)),
                         debug = TRUE)


  observeEvent(data(),

  updateDateRangeInput(inputId = "date_filter",
                       min = min(data()$date),
                       start = min(data()$date),
                       max = max(data()$date),
                       end = max(data()$date)))


  # ----------------------------------------------------------------------------
  # use return value
  # ----------------------------------------------------------------------------

  output$row <- renderUI(value_box(title = "Nb row",
                                   value = stats$row()))

  output$mean <- renderUI(value_box(title = "Mean value",
                                   value = stats$mean()))


}
