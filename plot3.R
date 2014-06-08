data<-read.table("household_power_consumption.txt", sep=";", header =T, 
                 colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric','numeric', 'numeric', 'numeric'),
                 na.strings='?')

# Using data for 2 days period
twodaysdata<-data[data$Date %in% c("1/2/2007","2/2/2007"),]                 



twodaysdata$datetime<-strptime(paste(twodaysdata$Date,twodaysdata$Time),"%d/%m/%Y %H:%M:%S")

# Open  plot3.png
png("plot3.png", height = 480, width = 480)
plot(twodaysdata$datetime,twodaysdata$Sub_metering_1,xlab ="", ylab = "Energy sub metering", type ="l",col = 'black')
lines(twodaysdata$datetime,twodaysdata$Sub_metering_2, col = "red")
lines(twodaysdata$datetime,twodaysdata$Sub_metering_3, col = "blue")
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c('black','red','blue'), lty = 1, lwd = 3)

# Close png file
dev.off() 