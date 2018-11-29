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
  titlePanel("Text predictor: Enter 2 words in the space provided"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      
      textInput("text_input1", "type first word here :"),
      textInput("text_input2", "type second word here :")
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h3(textOutput("Suggested Word"))
    )
  )
))
