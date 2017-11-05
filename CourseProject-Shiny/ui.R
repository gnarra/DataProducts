#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
library(shiny)

# The Stock Analysis UI for application
shinyUI(
	navbarPage("Basic Stock Technical Analysis!",
		tabPanel("Plot",
			 sidebarLayout(
			 	sidebarPanel(
			 		# Stock Symbol Text Box
			 		textInput("stockID", "Enter Stock Symbol:", "AAPL"),
			 		
			 		# Date Range
			 		dateRangeInput("date",
			 					   label=h5("Date Range:"),
			 					   format = "yyyy-mm-dd",
			 					   start=Sys.Date()-365,
			 					   end=Sys.Date()),
			 		
			 		# Chart Type
			 		selectInput("chartType",
			 					label =h5("Chart Type:"),
			 					choices=list("Daily", "Weekly")),
			 		
			 		
			 		# Technical Analysis Indicators
			 		checkboxGroupInput("checkGroup", label = h3("Technical Indicators"), 
			 						   choices = list("Volume" = "addVo()", 
			 						   			   "Bollinger Bands" = "addBBands()", 
			 						   			   "Relative Strength Index" = "addRSI()",
			 						   			   "Exponential Moving Averagee" = "addEMA()",
			 						   			   "Moving Average Convergence Divergence" = "addMACD()",
			 						   			   "Directional Movement Index" = "addADX()",
			 						   			   "On Balance Volume" = "addOBV()"),
			 						   selected = "addVo()"),
			 		
			 		# Submit Button
			 		submitButton("Submit")
			 	),
			 	
			 	mainPanel(
			 		plotOutput("stockPlot")
			 	)
			 )
		),
		tabPanel("Summary",
			verbatimTextOutput("summary")
		),
		tabPanel("About",
			includeMarkdown("Documentation.md")
		)
	)
)
