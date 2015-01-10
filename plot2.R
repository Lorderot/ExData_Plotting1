png(file="plot2.png", bg="transparent")
data<-read.csv("household_power_consumption.txt",sep=";",skip=66636,nrows=2880, col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
y<-logical(length(data[,3]))
for(i in 1:length(data[,3]))
  if (data[,3][i]!="?") y[i]<-TRUE
y<-data[["Global_active_power"]][y]
DateTime<-as.POSIXct(paste(data[["Date"]],data[["Time"]]), format="%d/%m/%Y %H:%M:%S")
Sys.setlocale(category = "LC_TIME", locale = "C")
plot(DateTime,y,xlab="",ylab="Global Active Power (kilowatts)",axes=TRUE,type="l", frame.plot=TRUE)

