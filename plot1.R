epc<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
epc2<-subset(epc,epc$EPCDate==as.Date("01/02/2007") | epc$EPCDate==as.Date("02/02/2007"))
rm(epc)
epc2<-filter(epc2,Global_active_power!="?")
epc2<-mutate(epc2,Global_active_power=as.numeric(Global_active_power))
png(filename = "plot1.png",width = 480, height = 480)
hist(epc2$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()

