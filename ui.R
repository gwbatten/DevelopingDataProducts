shinyUI(fluidPage(
        titlePanel("Engine Displacement"),
        
        sidebarLayout(
                sidebarPanel(
                        helpText("Explore how displacement varies with other engine/car parameters"),
                        
                        selectInput("var", 
                                    label = "Select a variable to compare with 'displacement'",
                                    choices = c("mpg", "horsepower", "acceleration", "weight", 
                                                "cylinders"),
                                    selected = "mpg"),
                        
                        selectInput("model", 
                                    label = "Select model type to be shown on the graph (if 
                                    appropriate).",
                                    choices = c("linear regression", "cubic spline", "both", "none"),
                                    selected = "none")
                ),
                
                mainPanel(
                        plotOutput("plot1")
                )
        )
))