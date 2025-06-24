

module_server <- function(id, trigger) {
  moduleServer(id, function(input, output, session) {

    # -- check parameter:
    # Stop and raise an error if trigger is not a reactive object
    stopifnot(is.reactive(trigger))

    # -- listen to the trigger & create a reactive
    # let's just print & return a x2 operation
    bar <- reactive({
      cat("Module parameter update / value =", trigger(), "\n")
      trigger() * 2})

    # -- call nested module
    sub_module_server(id = "submodule", trigger = bar)

  })
}
