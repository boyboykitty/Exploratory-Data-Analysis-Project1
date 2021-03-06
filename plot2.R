
library(dplyr)
# load date
mydata<-read.table("./data/household_power_consumption.txt", header = T,sep=";",nrows =70000,stringsAsFactors =FALSE)
## Converting dates
mydata$Date<- as.Date(strptime(mydata$Date, "%d/%m/%Y"))

# filter data
mydata<-filter(mydata,Date=='2007-2-1'|Date=='2007-2-2')

## Converting dates and data to numeric
datetime<-strptime(paste(mydata$Date,mydata$Time),"%Y-%m-%d %H:%M:%S")
globalActivePower <- as.numeric(mydata$Global_active_power)

 # show the date as English date 
Sys.setlocale(,"C") 

# plot2
png('plot2.png',width=480,height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()


