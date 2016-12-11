source("./get_clean_data.R")

#Read the data from the cleaned data file
pc <- read.table("./PowerConsumption.csv", sep = "," , header =  TRUE)
#open the device
png(filename='./plot3.png',width=480,height=480,units='px')

pc$DateTime <- as.POSIXlt(pc$DateTime)
plot(pc$DateTime, pc$SubMetering1, ylab = 'Energy Submettring', xlab='', type ='l' )
lines(pc$DateTime, pc$SubMetering2, col='red')
lines(pc$DateTime, pc$SubMetering3, col='blue')
legend("topright", col=c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty='solid')
#close the device
dev.off()