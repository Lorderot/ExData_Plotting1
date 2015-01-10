png(file="plot3.png", bg="transparent")
data<-read.csv("household_power_consumption.txt",sep=";",skip=66636,nrows=2880, col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
x<-logical(length(data[,7]))
y<-logical(length(data[,8]))
z<-logical(length(data[,9]))
for(i in 1:length(data[,7]))
  if (data[,3][i]!="?") x[i]<-TRUE
for(i in 1:length(data[,8]))
  if (data[,3][i]!="?") y[i]<-TRUE
for(i in 1:length(data[,9]))
  if (data[,3][i]!="?") z[i]<-TRUE
x<-data[["Sub_metering_1"]][x]
y<-data[["Sub_metering_2"]][y]
z<-data[["Sub_metering_3"]][z]
DateTime<-as.POSIXct(paste(data[["Date"]],data[["Time"]]), format="%d/%m/%Y %H:%M:%S")
Sys.setlocale(category = "LC_TIME", locale = "C")
plot(DateTime,x,xlab="",ylab="Energy sub metering",type="l", frame.plot=TRUE)
lines(DateTime,x,type="l",col="black")
lines(DateTime,y,type="l",col="red")
lines(DateTime,z,type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
