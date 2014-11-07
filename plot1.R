## read dataset
dataset <- read.table("household_power_consumption.txt",header = TRUE, sep = ";")
## format date as date class
dataset$Date <- as.Date(x = dataset$Date, format ="%d/%m/%Y")
## subset the required dates
sub_dataset <- subset(dataset, dataset$Date =="2007-02-01" | dataset$Date == "2007-02-02")
## convert variable factor to numeric
sub_dataset$Global_active_power <- as.numeric(levels(sub_dataset$Global_active_power))[sub_dataset$Global_active_power]
## plot histogram
hist(sub_dataset$Global_active_power, col="red", main = paste("Global Active Power"), ylim= c(0, 1200), xlab = "Global Active Power (kilowatts)")
## Copy my plot to a PNG file
dev.copy(png, file = "plot1.png") 
dev.off() 