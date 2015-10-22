
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

dat_disp<- dat %>%
  select(SiteID,WaterbodyName,State)

shinyServer(function(input, output) {

  output$cyanoData <- DT::renderDataTable(dat_disp,filter = "top",
                                          server = FALSE)
  output$downloadData <-
    downloadHandler("data.csv",
                    content = function(file) {
                    filt <- input$cyanoData_rows_all
                    write.csv(dat[filt,], file)
                    })
  })

