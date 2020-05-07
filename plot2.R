plot2<- function(){
## preparacion de datos
#1 
powerdata <- read.table("household_power_consumption.txt", sep=";", header = TRUE)

# cambiar los datos a las clases correctas

powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
powerdata$Time <- format(powerdata$Time, format="%H:%M:%S")
powerdata$Global_active_power <- as.numeric(powerdata$Global_active_power)
powerdata$Global_reactive_power <- as.numeric(powerdata$Global_reactive_power)
powerdata$Voltage <- as.numeric(powerdata$Voltage)
powerdata$Global_intensity <- as.numeric(powerdata$Global_intensity)
powerdata$Sub_metering_1 <- as.numeric(powerdata$Sub_metering_1)
powerdata$Sub_metering_2 <- as.numeric(powerdata$Sub_metering_2)
powerdata$Sub_metering_3 <- as.numeric(powerdata$Sub_metering_3)

# solo Febrero 1 y 2
powerdata_feb <-subset(powerdata, Date == "2007-02-01" | Date =="2007-02-02")

#agregar dias de la semana
library (dplyr)
library (lubridate)

#agregar dias y horas
weekdays <- mutate(powerdata_feb, "Weekday", wday(powerdata_feb$Date, label = TRUE))
weekdays <- rename(weekdays,hora = `paste(powerdata_feb$Date, powerdata_feb$Time)`)

#convertir en fechas días y hora
weekdays$hora <- ymd_hms(weekdays$hora)
s



#plot en png
## plot histogram of global active power for those 2 days
png("plot3.png", width=480, height=480)
with(weekdays, plot (hora, Sub_metering_1, type = "b"))
lines(weekdays$Sub_metering_2, type= "b", col = "red", lty = 2)
lines(weekdays$hora, weekdays$Sub_metering_3, type= "b", col = "blue")
lines(weekdays$hora, weekdays$Sub_metering_2, type= "b", col = "red",)
legend("topright", legend=c("Meter1", "Meter2", "Meter3"), col=c("black", "red", "blue"), lty= 1)
dev.off()
}
