source("./get_clean_data.R")
#Read the data from the cleaned data file
pc <- read.table("./PowerConsumption.csv", sep = "," , header =  TRUE)
pc$DateTime <- as.POSIXlt(pc$DateTime)

#open the pn device
png(filename='./plot4.png',width=480,height=480,units='px')

#set the plots display in 2 rows x 2 cols 
par(mfrow = c(2,2))
#do the plotting
with(pc, { plot(pc$DateTime, pc$GlobalActivePower, ylab = 'Global Active Power (Killowatts)', xlab='', type ='l' )
  plot(pc$DateTime, pc$Voltage, ylab = 'Voltage', xlab='datetime', type ='l' )
  
  plot(pc$DateTime, pc$SubMetering1, ylab = 'Energy Submettring', xlab='', type ='l' )
  lines(pc$DateTime, pc$SubMetering2, col='red')
  lines(pc$DateTime, pc$SubMetering3, col='blue')
  legend("topright", col=c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty='solid')
  
  plot(pc$DateTime, pc$GlobalReactivePower, ylab = 'Global_Reactive_Power', xlab='datetime', type ='l' )
  })
#close the device
dev.off()