
################################################################
##   You need to open in browser to see the results properly  ##
################################################################

#Requires shiny and googleevis library
library(shiny)
library (googleVis)

# the following code creates the slider which we can use to change the year for each state
shinyUI(fluidPage(
  titlePanel("GSP Per Year"),
  sidebarPanel(sliderInput("YR", "Select Year:", min = 1970, max = 1986, value = 500)),
  mainPanel(
    h3(textOutput("year")), 
    htmlOutput("gvis"))
))

