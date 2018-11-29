#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
#
# This is a Shiny web application. You can run the application by clickin
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(mvtnorm)
library(ggplot2)

# Define UI for application that draws a histogram
ui <- fluidPage(
    
    # Application title
    titlePanel("Correlation"),
    
    # Sidebar with a slider input for number of bins 
    
    # Show a plot of the generated distribution
    mainPanel(
        sliderInput("corr",
                    "Correlation value",
                    min = -1,
                    max = 1,
                    value = 0,
                    step = 0.0001),
        plotOutput("distPlot")
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        theme_set(theme_classic())
        rho <- input$corr
        X <- rmvnorm(500,c(0,0),matrix(c(1,rho,rho,1),nrow = 2,byrow = TRUE))
        # draw the histogram with the specified number of bins
        qplot(X[,1],X[,2],xlab = "X",ylab = "Y") + 
            scale_x_continuous(limits = c(-5,5)) + 
            scale_y_continuous(limits = c(-5,5))
        
    }
    )
}

# Run the application 
shinyApp(ui = ui, server = server,options = list(height = 500))