#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(tidyr)

data("USArrests")

arrests <- USArrests
arrests$state <- rownames(USArrests)
arrests <- gather(arrests, 'type', 'arrests',-c(UrbanPop, state))

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$distPlot <- renderPlot({

        
        urban_pop <- input$urban_pop
        num_arrests <- input$arrests
        state_input <- input$state_input
        
        if (state_input == 'ALL') {
            ggplot(arrests[arrests$UrbanPop > urban_pop & arrests$arrests > num_arrests,], 
                   aes(x=UrbanPop, y=arrests,color=type)) + 
                geom_point() + 
                ggtitle('US Arrests') + 
                xlab('Urban Population') +
                ylab('Arrests per 100 000 residents')
        } else {
            ggplot(arrests[arrests$state == state_input,], 
                   aes(x=UrbanPop, y=arrests,color=type)) + 
                geom_point() +
                ggtitle(paste(state_input," Arrests")) +
                xlab('Urban Population') +
                ylab('Arrests per 100 000 residents')
        }
        
    })

})
