#You would need to update this path based on where you have saved the productivity file
productivity <- read.csv("C:/Users/verse/Desktop/R code/productivity.csv")
attach(productivity)

#Requires shiny and googleevis library
library(shiny)
library (googleVis)

#the following code allows us to create a function which outputs the the entire map of US 
#color density represents the GSP per state. 
shinyServer(function(input, output)
{
  # retrive the input year
  myYear = reactive({ input$YR })
  output$year <- renderText({myYear()})
  
  output$gvis <- renderGvis({
    #filter dataset productivity by selected year
    mydata<-subset(productivity,(YR > (myYear()-1)) & (YR < (myYear()+1)))
    # draw the map, location variable is state, color variable is GSP amount
    gvisGeoChart(mydata,locationvar ="STATE", colorvar="GSP", 
                 options = list(region="US", displayMode="regions", resolution="provinces",
                                width=500, height=400,colorAxis="{colors:['#FFFFFF', '#0000FF']}"))
  })
})
