

#' Module Server Logic
#'
#' @param id the id of the instance
#' @param trigger a reactive object to trigger some internal task
#'
#' @examples
#' module_2_server(id = "module", trigger = reactive())


module_2_server <- function(id) {
  moduleServer(id, function(input, output, session) {

    # -- create reactive
    zoo <- reactiveVal(data.frame(id = 1:3, name = paste0("name_", 1:3)))

    # -- observe
    observe(
      if(is.null(zoo()))
        cat("Return value has been overwritten with NULL! \n"))

    # -- return value
    zoo

  })
}
