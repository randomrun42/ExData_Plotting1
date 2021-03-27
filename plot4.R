data <- read.csv2("household_power_consumption.txt", na.strings = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

datasub <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]

datasub$Global_active_power <- as.numeric(datasub$Global_active_power)
datasub$DateTime <- strptime(paste(datasub$Date, datasub$Time),
                             format="%Y-%m-%d %H:%M:%S")

png(file = "plot4.png")

par(mfrow = c(2, 2))

plot(datasub$DateTime, datasub$Global_active_power, type="l", xlab="",
     ylab="Global Active Power")

plot(datasub$DateTime, datasub$Voltage, type="l", xlab="datetime",
     ylab="Voltage")

plot(datasub$DateTime, datasub$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering")
lines(datasub$DateTime, datasub$Sub_metering_2, type="l", xlab="",
     ylab="", col="red")
lines(datasub$DateTime, datasub$Sub_metering_3, type="l", xlab="",
     ylab="", col="blue")
legend("topright", lwd = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(datasub$DateTime, datasub$Global_reactive_power, type="l", xlab="datetime",
     ylab="Global_reactive_power")

dev.off()
