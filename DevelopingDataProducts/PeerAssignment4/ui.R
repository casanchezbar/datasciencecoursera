#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Violent Crime Rates by US State, 1975"),

    h5("Statistics, in arrests per 100,000 residents for assault, murder, and rape in each of the 50 US states in 1973. Also given is the percent of the population living in urban areas"),
    
    br(),
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        
        sidebarPanel(
            sliderInput("urban_pop",
                        "Minimun Urban Population:",
                        min = 30,
                        max = 90,
                        value = 30),
            sliderInput("arrests",
                        "Minimun Arrests:",
                        min = 0,
                        max = 300,
                        value = 0),
            selectInput('state_input', "State", c('ALL',rownames(USArrests)),selected = NULL)
        ),
        
        
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot")
        )
    )
))
