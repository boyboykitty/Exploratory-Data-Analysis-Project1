
library(dplyr)
## load the data
mydata<-read.table("./data/household_power_consumption.txt", header = T,sep=";",nrows =70000,stringsAsFactors =FALSE)
mydata$Date<- as.Date(strptime(mydata$Date, "%d/%m/%Y"))
## filter the data
mydata<-filter(mydata,Date=='2007-2-1'|Date=='2007-2-2')
## Converting dates
globalActivePower <- as.numeric(mydata$Global_active_power)
#plot1
png('plot1.png',width=480,height=480)
hist(globalActivePower,col="red",main = "Global Active Power"
     ,xlab = "Global Active Power (kilowatts)")
dev.off()


