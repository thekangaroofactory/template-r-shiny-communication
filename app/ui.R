

# ------------------------------------------------------------------------------
# User-interface definition of the Shiny application
# ------------------------------------------------------------------------------

# -- Define & return UI
page_navbar(

  # -- Footer
  fillable = FALSE,
  footer = p(style = "font-size:9pt;margin-top:20px;", "© 2025 Philippe Peret"),

  # -- Theme
  theme = bs_theme(
    bg = "#2d3037",
    fg = "#FFF",
    primary = "orange",
    secondary = "#ececec",
    base_font = font_google("Quicksand")),

  # -- Title
  title = "Template",

  # -- First tab
  nav_panel(title = "Main Server",
            class = "p-5",

            p("The goal of this tutorial is to alter the module's data from the main server."),

            layout_columns(

              # -- left
              tagList(

                h4("Hit module input"),

                # -- from module
                tags$ul(
                  tags$li("Using the module button", br(), br(),
                          module_UI("module")),
                  tags$li("Using an actionLink from the main server", br(), br(),
                          uiOutput("link"))),

                # -- from main server
                h4("Hit module reactiveVal"),
                tags$ul(
                  tags$li("Using a button from the main app", br(), br(),
                          actionButton(inputId = "action_btn",
                                       label = "Action!")))),

              # -- right
              tagList(

                h4("Call module function"),
                tags$ul(
                  tags$li("Using a button from the main app", br(), br(),
                          actionButton(inputId = "alter",
                                       label = "Alter")),

                  tags$li("Using an actionLink from the main app", br(), br(),
                          actionLink(inputId = "dummy",
                                     label = "Action!",
                                     onclick = sprintf('Shiny.setInputValue(\"%s\", this.id, {priority: \"event\"})',
                                                       "action_link")))))),


            layout_columns(
              card(
                card_header("Module data"),
                DT::DTOutput("table")),
              ".")


  )

)
