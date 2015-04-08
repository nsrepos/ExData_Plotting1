plot1<-function(){
  library(data.table)
  hpc<-fread("household_power_consumption.txt",header=T,sep=";",colClasses = "character")
  hpc<-as.data.frame(hpc)
  hpc.sub<-subset(hpc,hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007" ,select=c(Global_active_power))
  png(filename = "plot1.png",
      width = 480, height = 480, units = "px")
  hist(as.numeric(hpc.sub$Global_active_power),main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

  dev.off()

}