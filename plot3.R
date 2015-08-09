plot3 <- function() {
  ## Extract the data file
  unzip ("data/exdata-data-household_power_consumption.zip", exdir = "./data/")

  ## Read the data
  dataset <- read.csv("data/household_power_consumption.txt", na.string = '?', sep =';')

  ## Subset the data
  dataset <- dataset[(dataset$Date == "1/2/2007" | dataset$Date == "2/2/2007"), ]

  ## Combine Date and Time
  dataset$DateTime <- strptime(paste(dataset$Date, dataset$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S" )

  ## Open png device
  png('plot3.png', width = 480, height = 480)

  ## Plot lines and add legend
  plot(dataset$DateTime,dataset$Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering')

  lines(dataset$DateTime,dataset$Sub_metering_2, col = "red")

  lines(dataset$DateTime,dataset$Sub_metering_3, col = "blue")

  legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col = c("black", "red", "blue"))

  ## Save file and close device
  dev.off()

  ## Remove the extracted file
  file.remove('./data/household_power_consumption.txt')
}

## Call the plot function to generate a plot on file load i.e source('plot3.R')
plot3()
