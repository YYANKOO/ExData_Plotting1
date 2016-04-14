## Load the data file
power<- read.table("./household_power_consumption.txt", header=T,sep=";")

## Subset the date
power$Date <- as.Date(power$Date,"%d/%m/%Y")
data <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data <- transform(data, datetime=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

## write the plot to png file
png("plot2.png", width=480, height=480)

plot(data$datetime, data$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")

## Close the device
dev.off()





