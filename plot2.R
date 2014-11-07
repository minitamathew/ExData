## Read dataset
dataset <- read.table("household_power_consumption.txt",header = TRUE, sep = ";")
## format date as date class
dataset$Date <- as.Date(x = dataset$Date, format ="%d/%m/%Y")
## subset the required dates
sub_dataset <- subset(dataset, dataset$Date =="2007-02-01" | dataset$Date == "2007-02-02")
## convert variable factor to numeric
sub_dataset$Global_active_power <- as.numeric(levels(sub_dataset$Global_active_power))[sub_dataset$Global_active_power]
## format time as time class
sub_dataset$Time <- paste(sub_dataset$Date, sub_dataset$Time, sep= ",")
sub_dataset$Time <- strptime(sub_dataset$Time, format="%Y-%m-%d,%H:%M:%S")
## plot Time vs. Global Active power
plot(sub_dataset$Time, sub_dataset$Global_active_power, type = "l", xlab= "", ylab= "Global Active Power(kilowatts)")
## Copy my plot to a PNG file
dev.copy(png, file = "plot2.png") 
dev.off()