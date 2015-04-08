plot4<-function(){
  library(data.table)
  hpc<-fread("household_power_consumption.txt",header=T,sep=";",colClasses = "character")
  hpc<-as.data.frame(hpc)
  hpc.sub<-subset(hpc,hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007" ,select=c(Date,Time,Global_active_power,Sub_metering_1, Sub_metering_2, Sub_metering_3,Voltage,Global_reactive_power))
  df=data.frame("x"=paste(hpc.sub$Date,hpc.sub$Time),
                "y"=as.numeric(hpc.sub$Global_active_power),
                "y1"=as.numeric(hpc.sub$Sub_metering_1),
                "y2"=as.numeric(hpc.sub$Sub_metering_2),
                "y3"=as.numeric(hpc.sub$Sub_metering_3),
                "y4"=as.numeric(hpc.sub$Voltage),
                "y5"=as.numeric(hpc.sub$Global_reactive_power))
  df$x=strptime(df$x,"%d/%m/%Y %H:%M:%S")

  png(filename = "plot4.png",
      width = 480, height = 480, units = "px")  
  
  par(mfrow=c(2,2)) # set the plot cells

  #plot 1,1
  par(mfg=c(1,1))   #set current cell
  plot(df$x,df$y,xlab="",ylab="Global Active Power (kilowatts)",type="l",lty=1)  
 
  #plot 2,1
  par(mfg=c(2,1))   #set current cell
  plot(df$x,df$y1,xlab="",ylab="Global Active Power (kilowatts)",type="l",lty=1,col="black")      
  lines(df$x,df$y2,xlab="",ylab="Global Active Power (kilowatts)",type="l",lty=1,col="red") 
  lines(df$x,df$y3,xlab="",ylab="Global Active Power (kilowatts)",type="l",lty=1,col="blue")
  legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red", "blue"),cex=1, bty="n")

  #plot 1,2
  par(mfg=c(1,2))   #set current cell
  plot(df$x,df$y4,xlab="datetime",ylab="Voltage",type="l",lty=1)  

  #plot 2,2
  par(mfg=c(2,2))   #set current cell
  plot(df$x,df$y5,xlab="datetime",ylab="Global_reactive_power",type="l",lty=1)  
  
  
  dev.off()

}