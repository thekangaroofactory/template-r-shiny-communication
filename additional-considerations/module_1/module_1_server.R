

module_1_server <- function(id, trigger) {
  moduleServer(id, function(input, output, session) {

    # -- check
    stopifnot(is.reactive(trigger))

    # -- just to execute the expression without adding other components
    observeEvent(trigger(), {

      # -- overwrites the parameter!
      trigger(NULL)

    })

  })
}
