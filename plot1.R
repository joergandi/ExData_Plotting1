plot1<-function(filename="household_power_consumption.txt") {
  range=as.Date(c("2007-02-01","2007-02-02"))
  d<-read.csv(filename,header=TRUE,sep=";",na.strings="?",dec=".")
  d$Date<-as.Date(d$Date,"%d/%m/%Y")
  dsub<- subset(d,Date%in%range)
  
  png("plot1.png",width=480,height=480)
  
  hist(dsub$Global_active_power,xlab="Global Active Power (kilowatts)",main = "Global Active Power",col="red")
  
  dev.off()
  
}