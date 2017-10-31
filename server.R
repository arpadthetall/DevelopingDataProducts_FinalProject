library(shiny)


shinyServer(function(input, output) {
        lmvariables <- reactive({
        var.vector <- as.vector(input$variables)
        lmFormula<-paste("mpg~",
                         ifelse(length(var.vector)>0,
                                predictors<-paste(var.vector,
                                                  collapse="+"),
                                "1"),
                         sep="")
        
    }) 
    
    #Fit model based on selected variables
    fitModel<-reactive({
        lm(as.formula(lmvariables()), data=mtcars)
    })
    
    #Output summary data
    output$summaryFit <- renderPrint({
        summary(fitModel())
    })
    #Plot 4 diagnostic plots for the generated regression model
    output$mpgPlot<-renderPlot({
        par(mfrow = c(2, 2), oma = c(0, 0, 0, 0))
        plot(fitModel(),
             which=c(1,2,3,5),
             col="blue", 
             sub.caption=paste("Plots for",
                               lmvariables()))
        
    })
    
})