png(file="plot1.png", bg="transparent")
data<-read.csv("household_power_consumption.txt",sep=";",skip=66636,nrows=2880, col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
y<-logical(length(data[,3]))
for(i in 1:length(data[,3]))
  if (data[,3][i]!="?") y[i]<-TRUE
y<-data[["Global_active_power"]][y]
hist(y,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",axes=FALSE)
axis(1,at=c(0,2,4,6))
axis(2,at=c(0,200,400,600,800,1000,1200))