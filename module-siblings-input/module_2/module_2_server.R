

# ------------------------------------------------------------------------------
# Module Server logic
# ------------------------------------------------------------------------------

module_2_server <- function(id) {
  moduleServer(id, function(input, output, session) {

    # -- get namespace
    ns <- session$ns

    observeEvent(input,
                 cat("Input(s) seen by the module_2 server:", paste(names(input), collapse = " / "), "\n"))

  })
}
