data<-read.table("household_power_consumption.txt", sep=";", header =T, 
                 colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric','numeric', 'numeric', 'numeric'),
                 na.strings='?')

# Using data for 2 days period
twodaysdata<-data[data$Date %in% c("1/2/2007","2/2/2007"),]                 


twodaysdata$datetime<-strptime(paste(twodaysdata$Date,twodaysdata$Time),"%d/%m/%Y %H:%M:%S")

# Open plot2.png

png("plot2.png", height = 480, width = 480)
plot(twodaysdata$datetime,twodaysdata$Global_active_power,xlab ="", ylab = "Global Active Power (kilowatts)", type ="l")

# Close png file

dev.off() 