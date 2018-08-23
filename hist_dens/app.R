#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)

# Define UI for application that draws a histogram
shinyApp(
    
    ui = fluidPage(
        numericInput("bins","Number of Bins",10,min = 0,max = 1000),
        plotOutput("hist")
    ),
    
    server = function(input, output) {
        output$hist = renderPlot({
            X = rnorm(10000)
            ggplot2::ggplot() + geom_histogram(aes(x = X, y = ..density..),bins = as.numeric(input$bins)) + xlab("Continuous numeric random variable") + scale_x_continuous(limits = c(-5,5)) + geom_line(aes(x = X,y = ..density..), color = "cadetblue",stat = 'density') 
        })
    },
    options = list(height = 500)
)
