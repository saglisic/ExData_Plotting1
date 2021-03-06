data<-read.table("household_power_consumption.txt", sep=";", header =T, 
                 colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric','numeric', 'numeric', 'numeric'),
                 na.strings='?')

# Using data for 2 days period
twodaysdata<-data[data$Date %in% c("1/2/2007","2/2/2007"),]                 



twodaysdata$datetime<-strptime(paste(twodaysdata$Date,twodaysdata$Time),"%d/%m/%Y %H:%M:%S")

# Open plot4.png
png("plot4.png", height = 480, width = 480)

# multi plot
par(mfrow=c(2,2))

# Global Active Power plot
plot(twodaysdata$datetime,twodaysdata$Global_active_power,xlab ="", ylab = "Global Active Power", type ="l")

# Voltage plot
plot(twodaysdata$datetime,twodaysdata$Voltage,xlab ="datetime", ylab = "Voltage", type ="l")

# Energy sub metering
plot(twodaysdata$datetime,twodaysdata$Sub_metering_1,xlab ="", ylab = "Energy sub metering", type ="l",col = 'black')
lines(twodaysdata$datetime,twodaysdata$Sub_metering_2, col = "red")
lines(twodaysdata$datetime,twodaysdata$Sub_metering_3, col = "blue")
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c('black','red','blue'), lty = 1, lwd = 3)

# Global Reactive power
plot(twodaysdata$datetime,twodaysdata$Global_reactive_power,xlab ="datetime", ylab = "Global_reactive_power", type ="l")

# Close png file
dev.off() 