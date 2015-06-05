plot4<-function(filename="household_power_consumption.txt") {
  range=as.Date(c("2007-02-01","2007-02-02"))
  d<-read.csv(filename,header=TRUE,sep=";",na.strings="?",dec=".")
  d$Date<-as.Date(d$Date,"%d/%m/%Y")
  dsub<- subset(d,Date%in%range)
  
  png("plot4.png",width=480,height=480)
  
  #make sure we have english labels
  curr_locale <- Sys.getlocale("LC_TIME")
  Sys.setlocale("LC_TIME","en_US.UTF-8")
  axislabels<-c(format(range[1],"%a"),format(range[2],"%a"),format(range[2]+1,"%a"))
  Sys.setlocale("LC_TIME",curr_locale)
  
  #2x2 grid
  par(mfrow=c(2,2))
  
  plot(dsub$Global_active_power,type="l",main="",ylab = "Global Active Power",xaxt = "n",xlab = "")
  axis(side=1,at=c(1,nrow(dsub[dsub$Date==range[1],])+1,nrow(dsub)+1),labels=axislabels)
  
  plot(dsub$Voltage,type="l",main="",ylab = "Voltage",xaxt = "n",xlab = "datetime")
  axis(side=1,at=c(1,nrow(dsub[dsub$Date==range[1],])+1,nrow(dsub)+1),labels=axislabels)
  
  plot(c(0,nrow(dsub)),range(c(dsub$Sub_metering_1,dsub$Sub_metering_2,dsub$Sub_metering_3)), type='n',main="",ylab = "Energy sub metering",xaxt = "n",xlab = "")
  lines(dsub$Sub_metering_1,type="l",col="black")
  lines(dsub$Sub_metering_2,type="l",col="red")
  lines(dsub$Sub_metering_3,type="l",col="blue")
  axis(side=1,at=c(1,nrow(dsub[dsub$Date==range[1],])+1,nrow(dsub)+1),labels=axislabels)
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),bty="n",lwd=1)
  
  plot(dsub$Global_reactive_power,type="l",main="",ylab = "Global_rective_power",xaxt = "n",xlab = "datetime")
  axis(side=1,at=c(1,nrow(dsub[dsub$Date==range[1],])+1,nrow(dsub)+1),labels=axislabels)
  
  dev.off()
  
}