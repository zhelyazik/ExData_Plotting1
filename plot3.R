##common part
png(filename = "plot4.png", width = 480, height = 480)
#Sys.setlocale("LC_ALL","English")
#ex_data <- read.table("../household_power_consumption.txt",sep=";",header = T, colClasses = "character")
period <- ex_data[(ex_data$Date=="1/2/2007")|(ex_data$Date=="2/2/2007"),]
for (column in 3:9){
  period[,column] <- as.numeric(period[,column])
}
period$datetime <- as.POSIXct(paste(period$Date,period$Time),format="%d/%m/%Y %H:%M:%S" )


with(period,plot(datetime,Sub_metering_1, type ="l",xlab="", ylab = "Energy sub metering"))
with(period,lines(datetime,Sub_metering_2, type ="l", col='red'))
with(period,lines(datetime,Sub_metering_3, type ="l", col='blue'))
legend("topright", names(period)[7:9], col=c("black","red","blue"), lty= 1)
dev.off()




##plot4
