
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(dplyr)

dat<-read.csv("Data2014.csv",stringsAsFactors = FALSE)%>%
  filter(SampleLocation != "Other" ||
           SampleLocation != "Calibration" ||
           SampleLocation != "Blank") %>%
  filter(!Flag) %>%
  filter(Fluorometer == "Beagle")%>%
  filter(Units=="ug/l")%>%
  filter(!is.na(Longitude))%>%
  filter(!is.na(Latitude))

shinyServer(function(input, output) {

  #output$choose_columns <- renderUI({
  #  selectInput("sel_cols", "Columns to show:", names(dat),
  #              selected = c("State","Parameter","Value","Units"),multiple=TRUE)
  #  })

  output$checkbox <- renderUI({
    checkboxGroupInput("check_cols", "Columns", names(dat),
                       selected = c("State","Parameter","Value","Units"),
                       inline = TRUE)
  })

  output$cyanoData <- DT::renderDataTable({dat[, input$check_cols, drop=FALSE]},
                                          filter = "top",
                                          server = FALSE)
  output$downloadData <-
    downloadHandler("data.csv",
                    content = function(file) {
                    rows <- input$cyanoData_rows_all
                    cols <- input$check_cols
                    write.csv(dat[rows,cols], file)
                    })
  })

