

#' Module Server Logic
#'
#' @param id the id of the instance
#' @param trigger a reactive object to trigger some internal task
#' @param debug a logical if more traces should be printed to the console (default FALSE)
#'
#' @examples
#' module_server(id = "module", trigger = reactive())


module_server <- function(id, trigger, debug = FALSE) {
  moduleServer(id, function(input, output, session) {

    # -- check parameter:
    # Stop and raise an error if trigger is not a reactive object
    stopifnot(is.reactive(trigger))

    # -- check parameter:
    # Force debug if not a logical (ex. debug = NULL)
    if(!is.logical(debug))
      debug <- FALSE

    # -- listen to reactive parameter
    observe({
      cat("Module reactive parameter hit \n")

      # -- dummy expression to take dependency on the parameter
      foo <- trigger()

      # -- to demonstrate static parameter
      if(debug)
        cat("- trigger =", trigger(), "\n")})

  })
}
