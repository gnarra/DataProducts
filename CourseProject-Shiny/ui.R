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
		    div(
		        h2("Welcome to Basic Stock Analysis Shiny Application"),
		        p("This application is a simple financial stock analysis. 
		            The stock data is downloaded from google financials using the R quantmod package. 
		            The quantmod's 'getSymbols' function downloads the data from google for the date range specified."),
		        p("The stock symbol and the date range values are wrapped in shiny 'reactive' construct. 
		            This basically means that as soon as one of the above values change the data object is flushed 
		            and new data is downloaded and loaded into stocksymbol variable. 
		            This data is constant as long as the values are not changed."),
		        p("The plots are generated from the cached data. The technical indicators are calculated on this 
		            data and then plotted in the main panel. The 'Submit' button generates the plots for basic analysis. 
		            This application is similar to [StockCharts](http://www.stockcharts.com/h-sc/ui?s=AAPL)"),
		        p("The technical indicators can produce a out of bounds errors when the plots don't have enough 
		            data to calculate the indicators for the plots. Ex: If the date range is less than 1 month and 
		            your are trying to plot MACD then it does not have enough data to plot."),
		        p("The Summary tab shows the summary of the stock data that is downloaded and cached using reactive programming.")
		    )
		)
	)
)
