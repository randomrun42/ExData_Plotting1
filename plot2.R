data <- read.csv2("household_power_consumption.txt", na.strings = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

datasub <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]

datasub$Global_active_power <- as.numeric(datasub$Global_active_power)
datasub$DateTime <- strptime(paste(datasub$Date, datasub$Time),
                             format="%Y-%m-%d %H:%M:%S")

png(file = "plot2.png")
plot(datasub$DateTime, datasub$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()
