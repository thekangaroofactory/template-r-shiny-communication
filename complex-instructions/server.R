

# ------------------------------------------------------------------------------
# Server logic of the Shiny application
# ------------------------------------------------------------------------------

# -- Define server function
function(input, output, session) {

  # -- create sample data
  data <- reactiveVal(data.frame(id = 1:2,
                                 name = paste0("name_", 1:2),
                                 count = 0))

  # -- helper function
  increment <- function(data, id){
    x <- data()
    x[x$id == id, ]$count <- x[x$id == id, ]$count + 1
    cat("Updated element id =", id, "/ count =", x[x$id == id, ]$count, "\n")
    data(x)}


  # ----------------------------------------------------------------------------
  # regular listeners
  # ----------------------------------------------------------------------------

  # -- button 1
  observeEvent(input$button_1,
               increment(data, id = 1))

  # -- button 2
  observeEvent(input$button_2,
               increment(data, id = 2))


  # ----------------------------------------------------------------------------
  # optimized listener
  # ----------------------------------------------------------------------------

  # -- single listener
  observeEvent(input$increment, {

    # -- get id from input value
    id <- unlist(strsplit(input$increment, "_"))[2]
    cat("Single input increment, id =", id, "\n")

    # -- increment count
    increment(data, id = id)

  })


  # ----------------------------------------------------------------------------
  # heterogeneous listener
  # ----------------------------------------------------------------------------

  # -- listener
  observeEvent(input$action, {

    # -- get values from input
    action <- unlist(strsplit(input$action, "_"))
    names(action) <- c("type", "id")

    # -- action
    if(action['type'] == "increment")
      increment(data, id = action['id'])
    else
      showNotification(paste("count =", data()[data()$id == action['id'], ]$count))

  })

}
