

module_1_server <- function(id) {
  moduleServer(id, function(input, output, session) {

    # -- return value
    reactive({

      # -- force update the reactive every 1 second
      invalidateLater(1000)

      # -- random value
      rnorm(n = 1)

    })

  })
}
