#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(quantmod)

shinyServer(function(input, output) {
  stockSymbol <- reactive({
    getStockData(input$stockID, input$date[1], input$date[2])
  })
  
  output$stockPlot <- renderPlot({
    # Convert the stock dat to proper format before plotting
    stockData <- stockSymbol()
    if(input$chartType == "Weekly") {
      stockData <- to.weekly(stockData)
    }
    
    # Plot the Data
    if(!is.null(input$checkGroup)) {
      taString <- paste(input$checkGroup, sep="", collapse = "; ")
      chartSeries(stockData, theme = chartTheme("white"),
                  type = "candlesticks", TA = taString, name = input$stockID)
    } else {
      chartSeries(stockData, theme = chartTheme("white"),
                  type = "candlesticks", TA = NULL, name = input$stockID)
    }
  })
  
  output$summary <- renderPrint({
  	summary(stockSymbol())
  })
  
  
  #' Download the data from Google for the stock symbol within the certain date range. 
  #' @param stockSymbol The stock symbol
  #' @param fromDate The from date
  #' @param toDate The to date
  #' @return The stock data between the dates
  getStockData <- function(stockSymbol, fromDate, toDate) {
    getSymbols(input$stockID, src = "google",
               from = fromDate,
               to = toDate,
               auto.assign = FALSE)
  }
})
