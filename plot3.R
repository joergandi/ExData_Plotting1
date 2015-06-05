plot3<-function(filename="household_power_consumption.txt") {
  range=as.Date(c("2007-02-01","2007-02-02"))
  d<-read.csv(filename,header=TRUE,sep=";",na.strings="?",dec=".")
  d$Date<-as.Date(d$Date,"%d/%m/%Y")
  dsub<- subset(d,Date%in%range)
  
  png("plot3.png",width=480,height=480)
  
  #make sure we have english labels
  curr_locale <- Sys.getlocale("LC_TIME")
  Sys.setlocale("LC_TIME","en_US.UTF-8")
  axislabels<-c(format(range[1],"%a"),format(range[2],"%a"),format(range[2]+1,"%a"))
  Sys.setlocale("LC_TIME",curr_locale)

  #create an empty plot which covers the full range of all three variables
  plot(c(0,nrow(dsub)),range(c(dsub$Sub_metering_1,dsub$Sub_metering_2,dsub$Sub_metering_3)), type='n',main="",ylab = "Energy sub metering",xaxt = "n",xlab = "")
  #then fill with line plots for each variable
  lines(dsub$Sub_metering_1,type="l",col="black")
  lines(dsub$Sub_metering_2,type="l",col="red")
  lines(dsub$Sub_metering_3,type="l",col="blue")
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1)
  
  #this is slightly weird, but i havent found any other solution, maybe with factors? but it will not just plot 3?
  axis(side=1,at=c(1,nrow(dsub[dsub$Date==range[1],])+1,nrow(dsub)+1),labels=axislabels)
  
  dev.off()
  
}