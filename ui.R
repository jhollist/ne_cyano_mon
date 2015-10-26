
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(dplyr)
library(DT)

#dat<-read.csv("Data2014.csv",stringsAsFactors = FALSE)%>%
#  filter(SampleLocation != "Other" ||
#           SampleLocation != "Calibration" ||
#           SampleLocation != "Blank") %>%
#  filter(!Flag) %>%
#  filter(Fluorometer == "Beagle")%>%
#  filter(Units=="ug/l")%>%
#  filter(!is.na(Longitude))%>%
#  filter(!is.na(Latitude))

shinyUI(fluidPage(

  # Application title
  titlePanel("New England Regional Cyanobacteria Monitoring Group Data Explorer"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      #selectInput('sel_cols', 'Columns to show:', names(dat),
      #            selected = c("State"),multiple=TRUE),

      #uiOutput("choose_columns"),
      uiOutput("checkbox"),

      downloadButton('downloadData', 'Download Data')
    ),

    # Show a plot of the generated distribution
    mainPanel(
      dataTableOutput("cyanoData")
    )
  )
))
