
library(dplyr)
#read data
mydata<-read.table("./data/household_power_consumption.txt", header = T,sep=";",nrows =70000,stringsAsFactors =FALSE)
#let data time readable
mydata$Date<- as.Date(strptime(mydata$Date, "%d/%m/%Y"))
# filter data 
mydata<-filter(mydata,Date=='2007-2-1'|Date=='2007-2-2')

#convert date and data to numeric
datetime<-strptime(paste(mydata$Date,mydata$Time),"%Y-%m-%d %H:%M:%S")
Sub_met_1 <- as.numeric(mydata$Sub_metering_1)
Sub_met_2 <- as.numeric(mydata$Sub_metering_2)
Sub_met_3 <- as.numeric(mydata$Sub_metering_3)
 # show the date as English date 
Sys.setlocale(,"C")   

# plot 3
png('plot3.png',width=480,height=480)
plot(datetime, Sub_met_1 , type="l", ylab="Energy Submetering", xlab="")
lines(datetime, Sub_met_2 , type="l", col="red")
lines(datetime, Sub_met_3 , type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()


