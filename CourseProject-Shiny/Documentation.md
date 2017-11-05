### Welcome to Basic Stock Analysis shiny application

This application is a simple financial stock analysis. The stock data is downloaded from google financials using the R quantmod package. The quantmod's "getSymbols" function downloads the data from google for the date range specified.

The stock symbol and the date range values are wrapped in shiny "reactive" construct. This basically means that as soon as one of the above values change the data object is flushed and new data is downloaded and loaded into stocksymbol variable. This data is constant as long as the values are not changed. 

The plots are generated from the cached data. The technical indicators are calculated on this data and then plotted in the main panel. The "Submit" button generates the plots for basic analysis. This application is similar to [StockCharts](http://www.stockcharts.com/h-sc/ui?s=AAPL)

The technical indicators can produce a out of bounds errors when the plots don't have enough data to calculate the indicators for the plots. Ex: If the date range is less than 1 month and your are trying to plot MACD then it does not have enough data to plot.

The Summary tab shows the summary of the stock data that is downloaded and cached using reactive programming.
