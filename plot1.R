data <- read.csv2("household_power_consumption.txt", na.strings = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

datasub <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]

datasub$Global_active_power <- as.numeric(datasub$Global_active_power)

png(file = "plot1.png")
hist(datasub$Global_active_power, xlab="Global Active Power (kilowatts)",
     col="red", main="Global Active Power")
dev.off()
