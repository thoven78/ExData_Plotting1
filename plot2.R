plot2 <- function() {
  ## Read the data
  dataset <- read.csv("data/household_power_consumption.txt", na.string = '?', sep =';')

  ## Subset the data
  dataset <- dataset[(dataset$Date == "1/2/2007" | dataset$Date == "2/2/2007"), ]

  ## Combine Date and Time
  dataset$DateTime <- strptime(paste(dataset$Date, dataset$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S" )

  ## Open png device
  png('plot2.png', width = 480, height = 480)

  ## Plot the graph
  plot(dataset$DateTime, dataset$Global_active_power, type = 'l', xlab = '', ylab = "Global Active Power (kilowatts)")

  ## Save file and close device
  dev.off()
}

## Call the plot function to generate a plot on file load i.e source('plot2.R')
plot2()
