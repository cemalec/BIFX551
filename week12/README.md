
# An Example R Project

[The app can be found here](https://cemalec.shinyapps.io/ExampleBIFX551/)
```{r}
#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

require(shiny)
require(dplyr)
require(ggplot2)

data("ToothGrowth")

# Define UI for application that draws a histogram
ui <- fluidPage(

   # Application title
   titlePanel("Example for BIFX551"),
   
   # Sidebar with a slider input for data range
   sidebarLayout(
      sidebarPanel(
         sliderInput("range", #A slider that selects range of len data
                     "Input range:",
                     min = min(ToothGrowth$len),
                     max = max(ToothGrowth$len),
                     value = c(min(ToothGrowth$len), max(ToothGrowth$len))), 
         textInput("xlab", "x label", "len"), #Labels the x-axis
         textInput("ylab", "y label", "dose"), #Labels the y-axis
         textInput("clab", "color label", "supp"), #Labels the color legend
         textInput("title", "title", "ToothGrowth"), #Creates a title for the graph
         
         textOutput("modelSlopes_VC"), #Slope of VC supplement linear model
         textOutput("modelSlopes_OJ") #Slope of OJ supplement linear model
      ),
      
      # Show a plot of lines as well as linear model output
      mainPanel(
         plotOutput("distPlot"), #Plot
         actionButton("savePlot", "Save Plot") #Saves graph
      )
   )
)

# Define server logic required to draw a line plot
server <- function(input, output) {
   #Select data according to user input
   filtered_ToothGrowth <- reactive({
    ToothGrowth %>% filter(len >= input$range[1]) %>% filter(len <= input$range[2]) 
   })
   
   #Calculate the linear model for VC data
   lm_vc <- reactive({
     data <- filtered_ToothGrowth()
     data_vc <- data %>% filter(supp == 'VC')
     lm(formula = len~dose, data = data_vc)
   })
   
   #Calculate the linear model for the OJ data
   lm_oj <- reactive({
     data <- filtered_ToothGrowth()
     data_oj <- data %>% filter(supp == 'OJ')
     lm(formula = len~dose, data = data_oj)
   })
   
   plotData <- reactive({
     # generate plot range based on input
     data <- filtered_ToothGrowth()
     lm_vc <- lm_vc()
     lm_oj <- lm_oj()
     data[data$supp=='VC','lm'] <- lm_vc$fitted.values
     data[data$supp=='OJ','lm'] <- lm_oj$fitted.values
     
     # Draw the points as well as fitted lines
     g <- ggplot(data, aes(x = dose, y = len, col = supp))
     g <- g + geom_jitter(width=0.1) 
     g <- g + geom_line(data = data, aes(x=dose,y = lm, col = supp))
     
     #Add labels and titles from text inputs
     g <- g + labs(x = input$xlab,
                   y = input$ylab,
                   col = input$clab,
                   title = input$title)
     g
   })
   
   #Save the Plot
   #Keep separate from renderPlot or graph will save everytime input changes
   #after first save.
   observeEvent(input$savePlot,{
     g <- plotData()
     ggsave("myPlot.png",plot = g, device="png",path="~/")
   })
   
   #Create the plot
   output$distPlot <- renderPlot({
      g <- plotData()
     
      g
   })
   
   #Displays the linear model slope for VC supplement
   output$modelSlopes_VC <- renderText({
     lm_vc <- lm_vc()
     slope_vc <- round(lm_vc$coefficients[2],2)
     vc_text <- paste0(c(input$ylab,"vs.",input$xlab,"for VC -",
                        as.character(slope_vc)),sep=' ')
   })
   
   #Displays the linear model slope for OJ supplement
   output$modelSlopes_OJ <- renderText({
     lm_oj <- lm_oj()
     slope_oj <- round(lm_oj$coefficients[2],2)
     oj_text <- paste0(c(input$ylab,"vs.",input$xlab,"for OJ -",
                        as.character(slope_oj)),sep=' ')
   })
}

# Run the application 
shinyApp(ui = ui, server = server)


```
