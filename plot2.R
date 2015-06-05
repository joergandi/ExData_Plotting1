plot2<-function(filename="household_power_consumption.txt") {
  range=as.Date(c("2007-02-01","2007-02-02"))
  d<-read.csv(filename,header=TRUE,sep=";",na.strings="?",dec=".")
  d$Date<-as.Date(d$Date,"%d/%m/%Y")
  dsub<- subset(d,Date%in%range)
  
  png("plot2.png",width=480,height=480)
  
  #make sure we have english labels
  curr_locale <- Sys.getlocale("LC_TIME")
  Sys.setlocale("LC_TIME","en_US.UTF-8")
  axislabels<-c(format(range[1],"%a"),format(range[2],"%a"),format(range[2]+1,"%a"))
  Sys.setlocale("LC_TIME",curr_locale)
  
  plot(dsub$Global_active_power,type="l",main="",ylab = "Global Active Power (kilowatts)",xaxt = "n",xlab = "")
  #this is slightly weird, but i havent found any other solution, maybe with factors? but it will not just plot 3?
  axis(side=1,at=c(1,nrow(dsub[dsub$Date==range[1],])+1,nrow(dsub)+1),labels=axislabels)
  
  dev.off()
  
}