
library(dplyr)
# load data
mydata<-read.table("./data/household_power_consumption.txt", header = T,sep=";",nrows =70000,stringsAsFactors =FALSE)
# let data time readable
mydata$Date<- as.Date(strptime(mydata$Date, "%d/%m/%Y"))
# filter data
mydata<-filter(mydata,Date=='2007-2-1'|Date=='2007-2-2')


# convert date and data to numeric
datetime<-strptime(paste(mydata$Date,mydata$Time),"%Y-%m-%d %H:%M:%S")
Sub_met_1 <- as.numeric(mydata$Sub_metering_1)
Sub_met_2 <- as.numeric(mydata$Sub_metering_2)
Sub_met_3 <- as.numeric(mydata$Sub_metering_3)
globalActivePower <- as.numeric(mydata$Global_active_power)
voltage<-as.numeric(mydata$Voltage)
globalReactivePower<-as.numeric(mydata$Global_reactive_power)
# show the date as English date 
Sys.setlocale(,"C")  

#plot4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(datetime,{
  #plot1
  plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")
  
  #plot2
  plot(datetime, voltage, type="l", xlab="Datetime", ylab="Voltage")
  
  #plot3
  plot(datetime, Sub_met_1 , type="l", ylab="Energy Submetering", xlab="")
  lines(datetime, Sub_met_2 , type="l", col="red")
  lines(datetime, Sub_met_3 , type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2,cex =0.7, bty="n", col=c("black", "red", "blue"))
  
  #plot4
  plot(datetime, globalReactivePower, type="l", xlab="Datetime", ylab="Global_reactive_power")

})
## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

