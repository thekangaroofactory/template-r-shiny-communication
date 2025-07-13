

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

            # -- inputs
            numericInput(inputId = "numeric_1",
                         label = "Value 1",
                         value = 0),

            numericInput(inputId = "numeric_2",
                         label = "Value 2",
                         value = 0),

            actionButton(inputId = "button",
                         label = "Increment count")

  )

)
