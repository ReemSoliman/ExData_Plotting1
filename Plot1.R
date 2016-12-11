
source("./get_clean_data.R")
#Read the data from the cleaned data file
pc <- read.table("./PowerConsumption.csv", sep = "," , header =  TRUE)

#open the device
png(filename='./plot1.png',width=480,height=480,units='px')
hist(as.numeric(pc$GlobalActivePower),main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red')
#close the device
dev.off()