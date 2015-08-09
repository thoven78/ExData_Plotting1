plot4 <- function() {
  ## Read the data
  dataset <- read.csv("data/household_power_consumption.txt", na.string = '?', sep =';')

  ## Subset the data
  dataset <- dataset[(dataset$Date == "1/2/2007" | dataset$Date == "2/2/2007"), ]

  ## Combine Date and Time
  dataset$DateTime <- strptime(paste(dataset$Date, dataset$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S" )

  ## Open png device
  png('plot4.png', width = 480, height = 480)

  par(mfrow = c(2, 2))

  ## Plot 2
  plot(dataset$DateTime, dataset$Global_active_power, type= 'l', xlab = '', ylab = "Global Active Power")

  plot(dataset$DateTime, dataset$Voltage , type = 'l', xlab = 'datetime', ylab = 'Voltage')


  ## Plot 3
  ## Plot lines and add legend
  plot(dataset$DateTime, dataset$Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering')
  lines(dataset$DateTime, dataset$Sub_metering_2, col = "red")
  lines(dataset$DateTime, dataset$Sub_metering_3, col = "blue")
  legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))

  ## Plot 4
  plot(dataset$DateTime, dataset$Global_reactive_power, type = 'l', xlab = 'datetime', ylab = 'Global_reactive_power')

  ## Save file and close device
  dev.off()
}

## Call the plot function to generate a plot on file load i.e source('plot4.R')
plot4()
