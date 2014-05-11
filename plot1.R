#plot1.R
setwd("../Desktop")
temp <- tempfile()
download.file(
   "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
   ,temp)
unzip(temp)
unlink(temp)
data <- read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?")
data$POSIX <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
low <- strptime("2007-02-01 00:00:00", "%Y-%m-%d %H:%M:%S")
high <- strptime("2007-02-03 00:00:00", "%Y-%m-%d %H:%M:%S")
x <- data[which(data$POSIX>=low&data$POSIX<=high),]

png(file="C:\\Users\\User\\ExData_Plotting1\\plot1.png",
    type="cairo",bg="transparent")
hist(x$Global_active_power,col='red',main='Global Active Power',
     xlab='Global Active Power (kilowatts)')
dev.off()