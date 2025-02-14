source("./get_clean_data.R")
pc <- read.table("./PowerConsumption.csv", sep = "," , header =  TRUE)
png(filename='./plot2.png',width=480,height=480,units='px')
pc$DateTime <- as.POSIXlt(pc$DateTime)
plot(pc$DateTime, pc$GlobalActivePower, ylab = 'Global Active Power (Killowatts)', xlab='', type ='l' )
#axis.Date(side = 1, pc$DateTime, format = '%A')
dev.off()