

shinyServer(function(input, output) {
        
        output$plot1 <- renderPlot({ library(ISLR)
                                     data(Auto)
                                     
                                     if (input$var == "cylinders") {
                                             #Boxplot data displacement vs number of cylinders
                                             boxplot(displacement~cylinders, data=Auto, main="Displacement vs Number of cylinders", 
                                                     xlab="Number of Cylinders", ylab="Displacement")
                                     } else {
                                     #Plot data and calculate/plot regression and spline lines  for mpg vs displacement
                                     plot(Auto[,input$var], Auto$displacement, main="Miles per Gallon vs Displacement", xlab="MPG", 
                                          ylab="Displacement", pch=20)}
                                     
                                     if (input$model == "linear regression") {
                                             reg <- lm(Auto$displacement~Auto[,input$var]) 
                                             abline(reg, col="darkgreen", lwd=2)
                                     } else if (input$model == "cubic spline") {
                                             spl <- smooth.spline(Auto[,input$var], Auto$displacement)
                                             lines(spl, col="red", lwd=2)
                                     } else if (input$model == "both") {
                                             spl <- smooth.spline(Auto[,input$var], Auto$displacement)
                                             reg <- lm(Auto$displacement~Auto[,input$var])
                                             lines(spl, col="red", lwd=2)
                                             abline(reg, col="darkgreen", lwd=2)
                                     }
        })
        
}
)