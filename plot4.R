## Load the data file
power<- read.table("./household_power_consumption.txt", header=T,sep=";")

## Subset the date
power$Date <- as.Date(power$Date,"%d/%m/%Y")
data <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]

data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data <- transform(data, datetime=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
data$Voltage <- as.numeric(as.character(data$Voltage))

# write the plot to png file
png("plot4.png", width=480, height=480)

par(mfrow = c(2,2))
## Plot 1
plot(data$datetime, data$Global_active_power, xlab="", ylab="Global Active Power", type="l")

## Plot 2
plot(data$datetime, data$Voltage, xlab="datetime", ylab="Voltage", type="l")

## Plot 3
plot(data$datetime, data$Sub_metering_1, xlab="", ylab="Engergy sub metering", type="l")
lines(data$datetime, data$Sub_metering_2, type="l", col="red")
lines(data$datetime, data$Sub_metering_3, type="l", col="blue")
legend("topright",col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n") #bty removes the box

## Plot 4
plot(data$datetime, data$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")

## Close the device
dev.off()