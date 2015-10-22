
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("New England Regional Cyanobacteria Monitoring Group Data Explorer"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      downloadButton('downloadData', 'Download Data')
    ),

    # Show a plot of the generated distribution
    mainPanel(
      DT::dataTableOutput("cyanoData")
    )
  )
))
