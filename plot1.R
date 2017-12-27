# Script to generate plot #1 for Exploratory Data Analysis, Project 1

require(dplyr)

# Read the source data, filter to correct dates and cast appropriate data to numeric

data <- read.csv(".\\household_power_consumption.txt",
                 header = TRUE, sep = ";", stringsAsFactors = FALSE)
data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)

# Plot the histogram of global active power by frequency

png(filename = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()