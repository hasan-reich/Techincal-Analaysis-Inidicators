#will be using the package quantmod to chart some technical indicators
#we can perform periodic returns,calcualte option exirations and many other things
#we will only be focusing on plotting techincal indicators this session
#installing and loading quantmod
install.packages(quantmod)
library(quantmod)

#the following will import all prices for desired stock using the ticket
#we will conduct our charts for Nike Inc stock (NKE) so we use that ticker
#this will import stock data from yahoo finance
getSymbols("NKE", src ="yahoo")

#take a look what the data actually consists of if intrested
head(NKE)

#when we imported stock data we imported all of nikes history from yahoo finance
#for techinical analysis we need to look at a shorter period and not many years
#we well use a quarter or 3 months to conduct our charts

#in order to do this we must subset our data to only contain the last 3 months
#there are numerous ways to do this in R
#simplest in this package is begin the chart and subset at the same time
#this also keeps the imported data unchanged and only subsets our charted data
#our chart will be a candlestick chart

chartSeries(NKE, subset = 'last 3 months')

#we will add four of the most widley used techinical indicators
#adding bollinger bands to our graph

addBBands()

#adding relative strength index

addRSI()

#adding moving avrage convergence divegrence 

addMACD()

#volume is already plotted by defualt with the graph

#since bollinger bands is one of my favorite indicators I will use it frequently
#it makes sense to create a function to plot it faster with the graph by defualt

chart <- function(x) {
  chartSeries(x, subset = 'last 3 months')
  addBBands()
  }

#this will now chart a subset of the last 3 months with bollinger bands 
#any desired company can be applied once imported 
chart(NKE)

#this package has many techincal indicators that can be explored
#they are usually added in the same manner we added the previous

#a few other popular ones are the moving average below
addEMA()

#stochastic momentum indicator to chart
addSMA()

#you may explore the rest of this package and add many other techincal indicators


