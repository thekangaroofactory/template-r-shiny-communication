

sub_module_server <- function(id, trigger) {
  moduleServer(id, function(input, output, session) {

    # -- check parameter:
    # Stop and raise an error if trigger is not a reactive object
    stopifnot(is.reactive(trigger))

    # -- take dependency on the parameter
    # any reactive / render will be fine
    observeEvent(trigger(),
                 cat("Sub-module parameter update / value =", trigger(), "\n"))

  })
}
