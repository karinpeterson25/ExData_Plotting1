setwd ("C://Users//kpeterson//Desktop//Coursera//04_Exploratory_Data_Analysis//Week 1//Project")


##  Read in and Format Data File
#######################################

unzip(zipfile="power_consumption.zip", exdir="./data")

data <- read.table("./data/household_power_consumption.txt", sep= ";", header=TRUE, stringsAsFactors = FALSE)

data07 <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))


## Re-Format Data Fields
#######################################

data07$Date <- as.Date(data07$Date, "%d/%m/%Y")

data07$Time <- strptime(paste(data07$Date, " ", data07$Time), format= "%Y-%m-%d %H:%M:%S")

data07$Global_active_power <- as.numeric(data07$Global_active_power)

data07$Global_reactive_power <- as.numeric(data07$Global_reactive_power)

data07$Voltage <- as.numeric(data07$Voltage)

data07$Global_intensity <- as.numeric(data07$Global_intensity)

data07$Sub_metering_1 <- as.numeric(data07$Sub_metering_1)

data07$Sub_metering_2 <- as.numeric(data07$Sub_metering_2)

data07$Sub_metering_3 <- as.numeric(data07$Sub_metering_3)

str(data07)


## Create Plot 4
######################################

png(file="plot4.png")

par(mfrow= c(2,2))

with(data07,
     {plot(Time, Global_active_power, xlab="", ylab="Global Active Power", type="n")
      lines(Time, Global_active_power)
    
      plot(Time, Voltage, xlab="datetime", type="n")
      lines(Time, Voltage)
      
      plot (Time, Sub_metering_1, xlab="", ylab="Energy sub metering", type="n")
      lines(Time, Sub_metering_1)
      lines(Time, Sub_metering_2, col="red")
      lines(Time, Sub_metering_3, col="blue")
      legend("topright", lty=1, col=c("black", "red", "blue"), 
             legend=c ("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
      
      plot(Time, Global_reactive_power, xlab="datetime", type="n")
      lines(Time, Global_reactive_power)
         
     })

dev.off()

