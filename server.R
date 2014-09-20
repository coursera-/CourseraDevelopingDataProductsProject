library(shiny)
library(quantmod)

shinyServer(function(input, output) {
  data <- reactive(getSymbols(c(input$stock),src="yahoo",from=Sys.Date()-input$range,auto.assign=FALSE))
  output$plot <- renderPlot({
      data <- data()
      if (input$stock == "AAPL") title <- "Apple"
      if (input$stock == "FB") title <- "Facebook"
      if (input$stock == "GOOG") title <- "Google"
      if (input$stock == "TWTR") title <- "Twitter"
      if (input$price == "Open") plot(data[,1], main=title)    
      if (input$price == "High") plot(data[,2], main=title)
      if (input$price == "Low") plot(data[,3], main=title)
      if (input$price == "Close") plot(data[,4], main=title)
  })
})
