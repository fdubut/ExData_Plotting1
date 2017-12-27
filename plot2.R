# Script to generate plot #2 for Exploratory Data Analysis, Project 1

require(dplyr)

# Read the source data, filter to correct dates and cast appropriate data to numeric

data <- read.csv(".\\household_power_consumption.txt",
                 header = TRUE, sep = ";", stringsAsFactors = FALSE)
data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)

# Plot the time series of global active power

png(filename = "plot2.png", width = 480, height = 480)
plot(data$DateTime, data$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()