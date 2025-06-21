

# ------------------------------------------------------------------------------
# Module Server logic
# ------------------------------------------------------------------------------

module_server <- function(id, trigger) {
  moduleServer(id, function(input, output, session) {

    # -- check params
    stopifnot(is.reactive(trigger))

    # -- get namespace
    ns <- session$ns


    # --------------------------------------------------------------------------
    # Module internal data
    # --------------------------------------------------------------------------

    # -- declare as reactive object
    data <- reactiveVal(data.frame(id = 1:3,
                                   name = paste("name_", 1:3),
                                   value = 0))


    # --------------------------------------------------------------------------
    # Module button
    # --------------------------------------------------------------------------

    # -- button
    output$action_btn <- renderUI(actionButton(inputId = ns("action"),
                                               label = "Action!"))

    # -- observe input
    observe({

      cat("Module input hit ")
      if(is.numeric(input$action))
        cat("count =", input$action, "\n")
      else
        cat("id =", input$action, "\n")

      # -- alter
      alter_element(data)

    }) |> bindEvent(input$action)


    # --------------------------------------------------------------------------
    # Trigger parameter
    # --------------------------------------------------------------------------

    # -- observe parameter
    observe({

      cat("Module parameter hit, value =", trigger(), "\n")

      # -- alter
      alter_element(data)

    }) |> bindEvent(trigger())


    # --------------------------------------------------------------------------
    # Observe data
    # --------------------------------------------------------------------------

    observeEvent(data(),
                 showNotification("Data altered",
                                  duration = 3, type = "message"), ignoreInit = TRUE)


    # --------------------------------------------------------------------------
    # Module return value
    # --------------------------------------------------------------------------

    list(ns = ns,
         data = data)

  })
}
