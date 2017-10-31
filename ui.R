library(shiny)
library(dplyr)

shinyUI(
    fluidPage(
        titlePanel("Select the variables to predict MPG"),
        
        sidebarLayout(
            sidebarPanel(
                
                #Adding Checkbox Group Input for User to select predictors
                checkboxGroupInput("variables", "Select the Predictors",
                                   c("Number of Cylinders" = "cyl",
                                     "Transmission Type" = "am",
                                     "Number of Gears" = "gear",
                                     "Displacement (cu.in.)" = "disp",
                                     "Horsepower" = "hp",
                                     "Rear Axle Ratio" = "drat",
                                     "Weight (1,000 lb.)" = "wt",
                                     "Time 1/4 Mile" = "qsec",
                                     "V-Engine or Standard" = "vs",
                                     "Number of Carburators" = "carb")),
                h3("Data Source"),
                helpText("The data was originally published in the 1974 Motor Trend US magazine, and 
                         has fuel consumption and 10 other aspects of automobile design and 
                         performance for 32 automobiles (1973-74 models)."),
                h3("Data"),
                p("Data frame with 32 observations on 11 variables."),
                
                h4("Source"),
                p("Henderson and Velleman (1981), Building multiple regression models 
                  interactively. Biometrics, 37, 391-411.")
            ),
            
            mainPanel(
                verbatimTextOutput("summaryFit"),
                plotOutput("mpgPlot")
                
            )
        )
    )
)