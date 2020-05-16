#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

require(shiny)
require(tidyverse)
require(maps)

fish <- read.csv('fish clean.csv')

# Define UI for application that draws a histogram
ui <- fluidPage(
  sidebarPanel(
    selectInput('species', 'Select a Fish Species',
                choices = as.list(levels(fish$spc))),
    textInput('title', 'Enter a title for the map',
              value = 'Max Weight of Catches for \'Species\'')
  ),
  mainPanel(
    plotOutput('mymap'),
    actionButton('save','Save Map'),
    plotOutput('myplot')
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  # Filters the data by the selected Species
  filter_fish <- reactive(
    fish %>% filter(spc == input$species)
  )
  
  # Creates a linear model
  fish_lm <- reactive({
    data <- filter_fish()
    lm(max.wt ~ lat, data = data)
    
  })
  
  # Creates a map based on the catch location and the max weight
  mapdata <- reactive({
    data <- filter_fish()
    north.america <- c('Canada','US')
    n.a.maps <- map_data('world', region = north.america)
    g <- ggplot()
    g <- g + geom_polygon(data = n.a.maps, aes(x = long, y = lat, group = group))
    g <- g + geom_point(data = data, aes(x=lon, y= lat, size = max.wt, color = max.wt))
    g <- g + coord_fixed(xlim = c(-125,-70), ylim = c(25, 60))
    g <- g + labs(title = input$title, x = 'Longitude', y = 'Latitude', color = 'Max Weight', size = 'Max Weight')
  })
  
  plotdata <- reactive({
    data <- filter_fish()
    lm <- fish_lm()
    data$lm <- lm$fitted.values
    g <- ggplot()
    g <- g + geom_point(data = data, aes(x = lat, y = max.wt))
    g <- g + geom_line(data = data, aes(x = lat, y = lm))
    g <- g + labs(title = 'Max Weight vs Latitude of Catch', x = 'Latitude', y = 'Max Weight')
  })
  observeEvent(input$save,{
    g <- mapdata()
    ggsave('myMap.png',plot = g, device = 'png', path = '~/')
  })
  # Outputs the created map
  output$mymap <- renderPlot({
    g <- mapdata()
    g
 })
  output$myplot <- renderPlot({
    g <- plotdata()
    g
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)
