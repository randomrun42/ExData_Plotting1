data <- read.csv2("household_power_consumption.txt", na.strings = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

datasub <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]

datasub$Global_active_power <- as.numeric(datasub$Global_active_power)
datasub$DateTime <- strptime(paste(datasub$Date, datasub$Time),
                             format="%Y-%m-%d %H:%M:%S")

png(file = "plot3.png")
plot(datasub$DateTime, datasub$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering")
lines(datasub$DateTime, datasub$Sub_metering_2, type="l", xlab="",
     ylab="", col="red")
lines(datasub$DateTime, datasub$Sub_metering_3, type="l", xlab="",
     ylab="", col="blue")
legend("topright", lwd = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
