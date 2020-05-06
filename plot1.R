plot1<- function(){
## preparacion de datos
#1 
powerdata <- read.table("household_power_consumption.txt", sep=";")
# nombre a las columnas
colnames(powerdata) <- c("Date", "Time","Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Submetering_3")
# cambiar los datos a las clases correctas

powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
powerdata$Time <- format(powerdata$Time, format="%H:%M:%S")
powerdata$Global_active_power <- as.numeric(powerdata$Global_active_power)
powerdata$Global_reactive_power <- as.numeric(powerdata$Global_reactive_power)
powerdata$Voltage <- as.numeric(powerdata$Voltage)
powerdata$Global_intensity <- as.numeric(powerdata$Global_intensity)
powerdata$Sub_metering_1 <- as.numeric(powerdata$Sub_metering_1)
powerdata$Sub_metering_2 <- as.numeric(powerdata$Sub_metering_2)
powerdata$Sub_metering_3 <- as.numeric(powerdata$Submetering_3)

# solo Febrero 1 y 2
powerdata_feb <-subset(powerdata, Date == "2007-02-01" | Date =="2007-02-02")

#plot en png
## plot histogram of global active power for those 2 days
png("plot1.png", width=480, height=480)
hist(powerdata_feb$Global_active_power, col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
}
