library(tidyr)

if (!file.exists('./PowerConsumption.csv')) {
    #Read the data file
    da <- read.table("./household_power_consumption.txt", sep = ";", na.strings='?', header = TRUE)
    #Change the table col names
    variablenames <- c("Date","Time","GlobalActivePower", "GlobalReactivePower", "Voltage", "GlobalIntensity", 
                       "SubMetering1","SubMetering2","SubMetering3")
    colnames(da) <- variablenames
    
    da$Date <- as.Date(da$Date, "%d/%m/%Y")
    Date1<-as.Date("2007-02-01")
    #subset the data getting the row for the dates "2007-02-01"& "2007-02-02" only 
    da1 <- subset(da, da$Date == Date1 | da$Date == as.Date("2007-02-02") )
    #combine the Date and Time columns in one column 
    pc <- unite(da1, DateTime, Date,Time, sep = ' ')
    pc$DateTime <- as.POSIXct(strptime(pc$DateTime, "%Y-%m-%d %H:%M:%S"))
    #write the csv file
    write.csv(pc,"PowerConsumption.csv",sep = "," , row.names = FALSE)
}