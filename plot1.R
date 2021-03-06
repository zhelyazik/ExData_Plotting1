##uncomment next line if you want to see weekdays in English
##Sys.setlocale("LC_ALL","English")

##load data
filePath <- "household_power_consumption.txt"
if (!file.exists(filePath)) stop("Error: file doesn't exist")
all_data <- read.table(filePath, sep=";",header = T, na.strings = '?',
                       colClasses = c(rep("character",2),rep("numeric",7)) )

##select 1/2/2007 and 2/2/2007 from all dates and create column "datetime"
period <- all_data[(all_data$Date=="1/2/2007")|(all_data$Date=="2/2/2007"),]
period$datetime <- as.POSIXct(paste(period$Date,period$Time),format="%d/%m/%Y %H:%M:%S" )

##set graphic device
png(filename = "plot1.png", width = 480, height = 480)

##plot graph
with(period,hist(Global_active_power,xlab = "Global Active Power (kilowatts)", 
                 main = "Global Active Power", col='red'))

dev.off()

##uncoment next line and write 'you_locale' to return you old locale, 
##if you've changed it in second line
##Sys.setlocale("LC_ALL","you_locale")
