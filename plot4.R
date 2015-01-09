#Sys.setlocale("LC_ALL","English")
#ex_data <- read.table("../household_power_consumption.txt",sep=";",header = T, colClasses = "character")
period <- ex_data[(ex_data$Date=="1/2/2007")|(ex_data$Date=="2/2/2007"),]

for (column in 3:9){
  period[,column] <- as.numeric(period[,column])
}
period$datetime <- as.POSIXct(paste(period$Date,period$Time),format="%d/%m/%Y %H:%M:%S" )

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
with(period,{
  ##plot topleft
  plot(datetime,Global_active_power, type ="l", xlab="",ylab = "Global Active Power (kilowatts)")  
  
  ##plot topright
  plot(datetime,Voltage, type = 'l')
  ##plot botomleft
  plot(datetime,Sub_metering_1, type ="l",xlab="", ylab = "Energy sub metering")
  lines(datetime,Sub_metering_2, type ="l", col='red')
  lines(datetime,Sub_metering_3, type ="l", col='blue')
  legend("topright", names(period)[7:9], col=c("black","red","blue"), lty= 1)
  
  ##plot botomright
  plot(datetime,Global_reactive_power, type = 'l')
  
  
})
dev.off()