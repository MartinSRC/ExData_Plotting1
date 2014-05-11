#plot4.R
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

png(file="C:\\Users\\User\\ExData_Plotting1\\plot4.png",
    type="cairo",bg="transparent")
par(mfrow=c(2,2))
plot(x$POSIX,x$Global_active_power,type='l',xlab='',
     ylab='Global Active Power')
plot(x$POSIX,x$Voltage,type='l',ylab='Voltage',xlab='datetime',lwd=1)
plot(x$POSIX,x$Sub_metering_1,type='l',xlab='',
     ylab='Energy sub metering')
lines(x$POSIX,x$Sub_metering_2,col='red')
lines(x$POSIX,x$Sub_metering_3,col='blue')
legend('topright',lty=1,col=c('black','red','blue'),
       bty='n',legend=names(x[,7:9]))
plot(x$POSIX,x$Global_reactive_power,type='l',,xlab='datetime',
     ylab='Global_reactive_power')
dev.off()