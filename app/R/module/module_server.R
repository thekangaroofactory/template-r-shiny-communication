

# ------------------------------------------------------------------------------
# Module Server logic
# ------------------------------------------------------------------------------

module_server <- function(id) {
  moduleServer(id, function(input, output, session) {

    # -- get namespace
    ns <- session$ns

    # -- declare trigger
    action_trigger <- reactiveVal()

    # -- declare reactive object
    data <- reactiveVal(data.frame(id = 1:3,
                                   name = paste("name_", 1:3),
                                   value = 0))


    # --------------------------------------------------------------------------
    # Outputs
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
      showNotification("Module input hit", input$action,
                       duration = 2, type = "message")

      # -- alter
      alter_element(data)

    }) |> bindEvent(input$action)


    # -- observe reactiveVal
    observe({

      cat("Module reactiveVal hit, value =", action_trigger(), "\n")
      showNotification("Module reactiveVal hit", action_trigger(),
                       duration = 2, type = "message")

      # -- alter
      alter_element(data)

      # -- need to reset action_trigger()
      action_trigger(NULL)

    }) |> bindEvent(action_trigger())


    # --------------------------------------------------------------------------
    # Alter data
    # --------------------------------------------------------------------------

    observeEvent(data(),
                 showNotification("Data altered",
                                  duration = 3, type = "message"), ignoreInit = TRUE)


    # --------------------------------------------------------------------------
    # Return value
    # --------------------------------------------------------------------------

    list(ns = ns,
         data = data,
         action = action_trigger)

  })
}

