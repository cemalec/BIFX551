#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for app that draws a histogram ----
ui <- fluidPage(
    
    # App title ----
    titlePanel("Hello Flower Lovers!"),
    
    # Sidebar layout with input and output definitions ----
    sidebarLayout(
        
        # Sidebar panel for inputs ----
        sidebarPanel(
            
            # Input: Slider for the number of bins ----
            sliderInput(inputId = "bins",
                        label = "Number of bins:",
                        min = 1,
                        max = 30,
                        value = 15)
            
        ),
        
        # Main panel for displaying outputs ----
        mainPanel(
            
            # Output: Histogram ----
            plotOutput(outputId = "distPlot")
            
        )
    )
)

# Define server logic required to draw a histogram ----
server <- function(input, output) {
    
    # Histogram of the Iris flower Data ----
    # with requested number of bins
    # This expression that generates a histogram is wrapped in a call
    # to renderPlot to indicate that:
    #
    # 1. It is "reactive" and therefore should be automatically
    #    re-executed when inputs (input$bins) change
    # 2. Its output type is a plot
    output$distPlot <- renderPlot({
        
        x    <- iris$Sepal.Length
        bins <- seq(min(x), max(x), length.out = input$bins + 1)
        
        hist(x, breaks = bins, col = "#7577DB", border = "#75DBD9",
             xlab = "Setosa, Versicolor & Virginica Sepal Length (cm)",
             main = "Sepal Length for Iris Species")
        
    })
    
}

# Create Shiny app ----
shinyApp(ui = ui, server = server)