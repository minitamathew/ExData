## Read dataset
dataset <- read.table("household_power_consumption.txt",header = TRUE, sep = ";")
##
## format date as date class
dataset$Date <- as.Date(x = dataset$Date, format ="%d/%m/%Y")
##
## subset the required dates
sub_dataset <- subset(dataset, dataset$Date =="2007-02-01" | dataset$Date == "2007-02-02")
##
## convert variable factor to numeric
sub_dataset$Global_active_power <- as.numeric(levels(sub_dataset$Global_active_power))[sub_dataset$Global_active_power]
sub_dataset$Sub_metering_1 <- as.numeric(levels(sub_dataset$Sub_metering_1))[sub_dataset$Sub_metering_1]
sub_dataset$Sub_metering_2 <- as.numeric(levels(sub_dataset$Sub_metering_2))[sub_dataset$Sub_metering_2]
sub_dataset$Voltage <- as.numeric(levels(sub_dataset$Voltage))[sub_dataset$Voltage]
sub_dataset$Global_reactive_power <- as.numeric(levels(sub_dataset$Global_reactive_power))[sub_dataset$Global_reactive_power]
##
## format time as time class
sub_dataset$Time <- paste(sub_dataset$Date, sub_dataset$Time, sep= ",")
sub_dataset$Time <- strptime(sub_dataset$Time, format="%Y-%m-%d,%H:%M:%S")
##
## plotting the data
png(file="plot4.png")
par(mfcol = c(2,2), mar= c(4,4,2,2))
with(sub_dataset,{
        plot(sub_dataset$Time, sub_dataset$Global_active_power, type = "l", xlab= "", ylab= "Global Active Power")
        plot(sub_dataset$Time, sub_dataset$Sub_metering_1, xlab="", ylab = "Energy sub metering", type = "n")
        lines(sub_dataset$Time, sub_dataset$Sub_metering_1)
        lines(sub_dataset$Time, sub_dataset$Sub_metering_2, col = "red")
        lines(sub_dataset$Time, sub_dataset$Sub_metering_3, col = "blue")
        legend("topright", text.font = 1, lty = c(1,1), col = c("black","blue", "red"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(sub_dataset$Time, sub_dataset$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
        plot(sub_dataset$Time, sub_dataset$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive power")
})
dev.off()