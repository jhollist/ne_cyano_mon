
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(dplyr)
library(DT)
library(leaflet)

################################################################################
#Maps Tab UI
################################################################################
map_tab <- sidebarLayout(
  sidebarPanel(uiOutput("mapselect")),
  mainPanel(leafletOutput("map"))
)

################################################################################
#Analysis Tab UI
################################################################################
analysis_tab <- sidebarLayout(
  sidebarPanel(
    #Controls for boxplots

  ),
  mainPanel(
    #boxplots for chla or phyco
  )
)

################################################################################
#Data Tab UI
################################################################################
data_tab <- sidebarLayout(
  sidebarPanel(
    uiOutput("checkbox"),
    downloadButton('downloadData', 'Download Data')
  ),

  # Show a plot of the generated distribution
  mainPanel(
    dataTableOutput("cyanoData")
  )
)

################################################################################
#Combined UI
################################################################################

shinyUI(fluidPage(

  # Application title
  titlePanel("New England Regional Cyanobacteria Monitoring Group Data Explorer"),

  # Sidebar with a slider input for number of bins
  tabsetPanel(
    tabPanel("Maps", map_tab),
    tabPanel("Analysis"),
    tabPanel("Data", data_tab)
    )
  )
)

