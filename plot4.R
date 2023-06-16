epc<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
epc2<-filter(epc,EPCDate=="1/2/2007" | EPCDate=="2/2/2007")
rm(epc)
epc2<-filter(epc2,Global_active_power!="?")
epc2<-mutate(epc2,Global_active_power=as.numeric(Global_active_power))
epc2<-mutate(epc2,EPCDT=dmy_hms(paste(EPCDate,EPCTime)))
epc2<-mutate(epc2,Global_reactive_power=as.numeric(Global_reactive_power))
epc2<-mutate(epc2,EPCDTN=as.numeric(EPCDT))
png(filename = "plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))
hist(epc2$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

plot(epc2$EPCDTN,epc2$Global_active_power,type='l',xlab="",ylab="Global Active Power (kilowatts)",xaxt="n")
axis(1,labels=c("Thu","Fri","Sat"),at=c(min(epc2$EPCDTN),mean(epc2$EPCDTN),max(epc2$EPCDTN)))

plot(epc2$EPCDT,epc2$Sub_metering_1,type='l',col="black",xlab="",ylab="Energy sub metering",xaxt="n")
points(epc2$EPCDT,epc2$Sub_metering_2,type='l',col="red")
points(epc2$EPCDT,epc2$Sub_metering_3,type='l',col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1)
axis(1,labels=c("Thu","Fri","Sat"),at=c(min(epc2$EPCDTN),mean(epc2$EPCDTN),max(epc2$EPCDTN)))

plot(epc2$EPCDT,epc2$Global_reactive_power,pch=20,type="h",xlab="datetime",ylab="Global_reactive_power")

dev.off()