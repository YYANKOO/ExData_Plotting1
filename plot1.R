setwd("C:/Users/yyan-koo/Data Science Specification/Courses/Course 4 Exploratory Data Analysis/Week 1/Assignment/Data")

## Load the data file
power<- read.table("./household_power_consumption.txt", header=T,sep=";")

## Subset the date
power$Date <- as.Date(power$Date,"%d/%m/%Y")
data <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

## write the plot to png file
png("plot1.png", width=480, height=480)

hist(data$Global_active_power, main = paste("Global Active Power"),  xlab="Global Active Power (kilowatts)", col="red")

## Close the device
dev.off() 


