plot1 <- function() {
  ## Read the data
  dataset <-read.table('data/household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?')

  ## Subset the data
  dataset <- dataset[dataset$Date =='1/2/2007' | dataset$Date== '2/2/2007', ]

  ## Combine date and time
  dataset$DateTime <- strptime(paste(dataset$Date , dataset$Time), format = "%d/%m/%Y %H:%M:%S")

  ## Open png device
  png(filename = 'plot1.png', width = 480, height = 480, units = 'px')

  ## Plot the graph
  hist(dataset$Global_active_power, main = "Global Active Power", xlab = 'Global Active Power(kilowatts)', ylab = 'Frequency', col = 'red' )

  ## Save file and close device
  dev.off()
}

## Call the plot function to generate a plot on file load i.e source('plot1.R')
plot1()
