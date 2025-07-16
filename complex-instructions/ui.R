

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

            # -- regular inputs
            card(
              card_header("Regular inputs"),
              layout_columns(
                actionButton(inputId = "button_1",
                             label = "Increment count 1"),

                actionButton(inputId = "button_2",
                             label = "Increment count 2"))),


            # -- optimized input
            card(
              card_header("Optimized input"),
              layout_columns(
                actionButton(inputId = "row_1",
                             label = "Increment count 1",
                             onclick = 'Shiny.setInputValue(\"increment\", this.id, {priority: \"event\"})'),

                actionButton(inputId = "row_2",
                             label = "Increment count 2",
                             onclick = 'Shiny.setInputValue(\"increment\", this.id, {priority: \"event\"})'))),


            # -- heterogeneous input
            card(
              card_header("Heterogeneous input"),
              layout_columns(
                actionButton(inputId = "increment_1",
                             label = "Increment count 1",
                             onclick = 'Shiny.setInputValue(\"action\", this.id, {priority: \"event\"})'),

                actionButton(inputId = "display_2",
                             label = "Show count 2",
                             onclick = 'Shiny.setInputValue(\"action\", this.id, {priority: \"event\"})')))

  )

)
