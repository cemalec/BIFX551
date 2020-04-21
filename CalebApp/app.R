#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)


# Define UI ----
ui <- fluidPage(
    titlePanel("My Shiny App"),
    sidebarPanel(
        helpText('Create a boxplot based on the \'iris\'dataset'),
        selectInput('p', 'Choose the first variable',
                    choices = list(
                        'Sepal Length' = 'Sepal.Length',
                        'Sepel Width' = 'Sepal.Width',
                        'Petal Length' = 'Petal.Length',
                        'Petal Width' = 'Petal.Width'
                    )),
    ),
    mainPanel(
        plotOutput('myplot')
    )
)

# Define server logic ----
server <- function(input, output, session) {
    
    output$myplot <- renderPlot({
        boxplot(iris[,input$p] ~ iris$Species)
    })
}

# Run the app ----
shinyApp(ui = ui, server = server)