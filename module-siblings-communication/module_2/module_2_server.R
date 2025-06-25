

#' Module Server Logic
#'
#' @param id the id of the instance
#' @param trigger a reactive object to trigger some internal task
#'
#' @examples
#' module_2_server(id = "module", trigger = reactive())


module_2_server <- function(id, trigger) {
  moduleServer(id, function(input, output, session) {

    # -- check parameter:
    # Stop and raise an error if trigger is not a reactive object
    stopifnot(is.reactive(trigger))

    # -- listen to reactive parameter
    observe(
      cat("Module2 parameter update, value =", trigger(), "\n"))

  })
}
