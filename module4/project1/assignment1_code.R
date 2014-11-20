#Read in the table from a text file with header column
elec <- read.table("household_power_consumption.txt", header = T, sep = ";", dec = ".", stringsAsFactors=F, na.strings = "?")

#Dates and times are in separate columns. Combine them into one new datetime column
elec$new <- paste(elec$Date, elec$Time)

#Change the DateTime column to a posixct column
elec$new <- as.POSIXct(elec$new, format="%d/%m/%Y %H:%M:%S")

#Subset the table to take only a certain date window
elec_win <- subset(elec, (elec$new >= as.POSIXct("2007-02-01") & elec$new <= as.POSIXct("2007-02-02 23:59:59")))

#Plot 1
hist(elec_win$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "Plot_1.png", width = 480, height = 480)
dev.off()

lapply(elec, class)

#Plot 2
plot(elec_win$new, elec_win$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "Plot_2.png", width = 480, height = 480)
dev.off()

#Plot 3
plot(elec_win$new, elec_win$Sub_metering_1, ylim = c(0, 40), xlab = "", ylab = "Energy Sub Metering", type = "l", col = "black")
par(new=T)
plot(elec_win$new, elec_win$Sub_metering_2, ylim = c(0, 40), axes = F, xlab = "", ylab = "", type = "l", col = "red")
par(new=T)
plot(elec_win$new, elec_win$Sub_metering_3, ylim = c(0, 40), axes = F, xlab = "", ylab = "", type = "l", col = "blue")
legend("topright", lty = 1, col = c("blue", "red", "black"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "Plot_3.png", width = 480, height = 480)
dev.off()

#Plot 4
par(mfrow = c(2, 2))
plot(elec_win$new, elec_win$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(elec_win$new, elec_win$Voltage, type = "l", xlab="datetime", ylab = "Voltage")
plot(elec_win$new, elec_win$Sub_metering_1, ylim = c(0, 40), xlab = "", ylab = "Energy Sub Metering", type = "l", col = "black")
par(new=T)
plot(elec_win$new, elec_win$Sub_metering_2, ylim = c(0, 40), axes = F, xlab = "", ylab = "", type = "l", col = "red")
par(new=T)
plot(elec_win$new, elec_win$Sub_metering_3, ylim = c(0, 40), axes = F, xlab = "", ylab = "", type = "l", col = "blue")
legend("topright", lty = 1, col = c("blue", "red", "black"), , bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
par(new=F)
plot(elec_win$new, elec_win$Global_reactive_power, type = "l", xlab="datetime", ylab = "Global_Reactive_Power")
dev.copy(png, file = "Plot_4.png", width = 480, height = 480)
dev.off()
       