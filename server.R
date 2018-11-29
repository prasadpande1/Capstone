#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(RCurl)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  read_bigram <- getURL("https://raw.githubusercontent.com/prasadpande1/Capstone/master/bigrams_final.csv")
  read_bigram_formatted <- read.csv(text = read_bigram)
  read_trigram <- getURL("https://raw.githubusercontent.com/prasadpande1/Capstone/master/trigram_final.csv")
  read_trigram_formatted <- read.csv(text = read_trigram)
  
  #str <-as.character(input$text_input1)
  #convertedText <- reactive(as.list(scan(text=str, what='', sep=' ')))
  
  output$`Suggested Word` <- renderText({
    if(input$text_input1 > "")
      if(input$text_input2 == "")
      {result <- read_bigram_formatted[grep(input$text_input1, read_bigram_formatted$X1, ignore.case = T),]
      paste("Next predicted word using bigram is ::",result$X2[1])}
    else 
    {result <- read_trigram_formatted[grep(input$text_input1, read_bigram_formatted$X1, ignore.case = T),]
    result1 <- result[grep(input$text_input2, result$X2, ignore.case = T),]
    paste("Next predicted word using trigram is ::",result1$X3[1])}
    else 
      
      paste("Please enter the text in first box")
  })
})