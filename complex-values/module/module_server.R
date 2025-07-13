

#' Module Server Logic
#'
#' @param id the id of the instance
#' @param trigger a list to trigger some internal task
#'
#' @returns A list with the following shape
#' list(count,
#'      stats = list(sum,
#'                   mean))
#'
#' @details
#' The trigger argument should be a named list with the pattern list(button, value_1, value_2)
#' values must be reactive objects.
#'
#' @examples
#' module_server(id = "module", trigger = list(button = reactive(), value_1 = reactive(), value_2 = reactive()))


module_server <- function(id, trigger) {
  moduleServer(id, function(input, output, session) {

    # -- check parameter:
    # Stop and raise an error if trigger is not a list
    stopifnot(is.list(trigger))
    stopifnot(is.reactive(trigger$button))
    stopifnot(is.reactive(trigger$value_1))
    stopifnot(is.reactive(trigger$value_2))


    # -- compute sum & mean
    val_sum <- reactive(sum(trigger$value_1(), trigger$value_2()))
    val_mean <- reactive(mean(c(trigger$value_1(), trigger$value_2())))


    # -- return value
    list(
      count = trigger$button,
      stats = list(
        sum = val_sum,
        mean = val_mean))

  })
}
