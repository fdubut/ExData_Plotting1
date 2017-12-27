# Script to generate plot #4 for Exploratory Data Analysis, Project 1

require(dplyr)

# Read the source data, filter to correct dates and cast appropriate data to numeric

data <- read.csv(".\\household_power_consumption.txt",
                 header = TRUE, sep = ";", stringsAsFactors = FALSE)
data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Voltage <- as.numeric(data$Voltage)

# Split the plotting area 2x2

png(filename = "plot4.png", width = 480, height = 480)
par(mfcol=c(2,2))

# Plot the time series of global active power

plot(data$DateTime, data$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power")

# Plot the time series of energy sub metering (x3)

plot(data$DateTime, data$Sub_metering_1, type = "l", col= "black",
     xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, type = "l", col= "red")
lines(data$DateTime, data$Sub_metering_3, type = "l", col= "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       bty = "n", lty = c(1,1,1), col = c("black", "red", "blue"))

# Plot the time series of voltage

plot(data$DateTime, data$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")

# Plot the time series of global reactive power

plot(data$DateTime, data$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")
dev.off()