

# ------------------------------------------------------------------------------
# Module Server logic
# ------------------------------------------------------------------------------

module_1_server <- function(id) {
  moduleServer(id, function(input, output, session) {

    # -- get namespace
    ns <- session$ns

    observeEvent(input,
                 cat("Input(s) seen by the module_1 server:", paste(names(input), collapse = " / "), "\n"))

  })
}
