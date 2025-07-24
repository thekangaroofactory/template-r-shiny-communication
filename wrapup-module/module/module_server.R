

#' Module Server Logic
#'
#' @param id the id of the instance
#' @param dataset a reactive object containing the data
#' @param debug a logical if more traces should be printed to the console (default FALSE)
#'
#' @examples
#' module_server(id = "module", dataset = reactive())


module_server <- function(id, dataset, filters, debug = FALSE) {
  moduleServer(id, function(input, output, session) {

    # -- check parameter:
    # Stop and raise an error if dataset is not a reactive object
    stopifnot(is.reactive(dataset))

    # -- check parameter:
    # Force debug if not a logical (ex. debug = NULL)
    if(!is.logical(debug))
      debug <- FALSE

    # -- apply filters
    filtered_data <- reactive({
      x <- dataset()
      x <- x[x$date >= filters$date()[[1]] & x$date <= filters$date()[[2]], ]
      x <- x[x$category == filters$category(), ]
      x
    })

    # -- compute stats
    nb_row <- reactive(nrow(filtered_data()))
    mean_value <- reactive(mean(filtered_data()$value))

    # -- return value
    list(
      row = nb_row,
      mean = mean_value)

  })
}
