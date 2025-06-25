

sub_module_server <- function(id) {
  moduleServer(id, function(input, output, session) {

    # -- return value
    reactive({

      # -- Re-execute this reactive expression after 1 second
      invalidateLater(1000)

      # -- random value
      rnorm(n = 1)

    })

  })
}
