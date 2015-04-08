plot3<-function(){
  library(data.table)
  hpc<-fread("household_power_consumption.txt",header=T,sep=";",colClasses = "character")
  hpc<-as.data.frame(hpc)
  hpc.sub<-subset(hpc,hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007" ,select=c(Date,Time,Sub_metering_1, Sub_metering_2, Sub_metering_3))
  df=data.frame("x"=paste(hpc.sub$Date,hpc.sub$Time),"y1"=as.numeric(hpc.sub$Sub_metering_1),"y2"=as.numeric(hpc.sub$Sub_metering_2),"y3"=as.numeric(hpc.sub$Sub_metering_3))
  df$x=strptime(df$x,"%d/%m/%Y %H:%M:%S")
  
  png(filename = "plot3.png",
      width = 480, height = 480, units = "px")
  plot(df$x,df$y1,xlab="",ylab="Global Active Power (kilowatts)",type="l",lty=1,col="black")      
  lines(df$x,df$y2,xlab="",ylab="Global Active Power (kilowatts)",type="l",lty=1,col="red") 
  lines(df$x,df$y3,xlab="",ylab="Global Active Power (kilowatts)",type="l",lty=1,col="blue")
  legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red", "blue"))
  
  dev.off()

}