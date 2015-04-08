plot2<-function(){
  library(data.table)
  hpc<-fread("household_power_consumption.txt",header=T,sep=";",colClasses = "character")
  hpc<-as.data.frame(hpc)
  hpc.sub<-subset(hpc,hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007" ,select=c(Date,Time,Global_active_power))
  df=data.frame("x"=paste(hpc.sub$Date,hpc.sub$Time),"y"=as.numeric(hpc.sub$Global_active_power))
  df$x=strptime(df$x,"%d/%m/%Y %H:%M:%S")
  
  png(filename = "plot2.png",
      width = 480, height = 480, units = "px")
  plot(df$x,df$y,xlab="",ylab="Global Active Power (kilowatts)",type="l",lty=1)  
    
  dev.off()

}