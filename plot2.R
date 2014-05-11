#plot2.R
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

png(file="C:\\Users\\User\\ExData_Plotting1\\plot2.png",
    type="cairo",bg="transparent")
plot(x$POSIX,x$Global_active_power,type='l',xlab='',
     ylab='Global Active Power (kilowatts)')
dev.off()
