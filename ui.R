library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Stock Price Explorer"),
  sidebarPanel(
    radioButtons("stock","Stock:",c("AAPL","FB","GOOG","TWTR"),selected="FB"),
    selectInput("price","Price:",c("Open","High","Low","Close")),
    sliderInput("range","Range (days):",7,365,30)
  ),
  mainPanel(
    plotOutput("plot")
  )
))
