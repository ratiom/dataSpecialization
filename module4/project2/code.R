f1 <- readRDS("./data/summarySCC_PM25.rds")
f2 <- readRDS("./data/Source_Classification_Code.rds")
balti <- f1[f1$fips == "24510", ]
lala <- f1[f1$fips == '06037', ]

#Plot1

sum(f1$Emissions, f1$year=="2002")

#Plot 3
ddply(balti, "type", numcolwise(sum))
sum(balti$Emissions, f1$type=="NON-ROAD" & f1$year=="1999")
sum(balti$Emissions, f1$type=="NONPOINT")
sum(balti$Emissions, f1$type=="ON-ROAD")
sum(balti$Emissions, f1$type=="POINT")

#Plot 4

#Subsetting the Source Classification Code Table for Coal-based emmiting sectors
f2coal <- f2[grep("Coal", f2$EI.Sector), ]
#Matching SCC codes in subsetted Code Table to SCC codes in Emissions table
f1coal <- f1[which(f1$SCC %in% f2coal$SCC), ]

#Plot 5
#by looking up table(f2$EI.Sector) we can see categories called "Mobile". The categories pertaining to motor vehicles
# will contain "Mobile", and subtracting those contining "Aircraft" and "Locomotives", which are not motor vehicles

#Get entries containing mobile...
f2mobile <- f2[grep("Mobile", f2$EI.Sector), ]

#Subtract "Aircraft" and "Locomotive" entries
f2motor <- f2mobile[-(grep("Aircraft|Locomotive", f2mobile$EI.Sector)), ]

#which Baltimore emissions entries are motor (by SCC) entries
balti_motor <- balti[which(balti$SCC %in% f2motor$SCC), ]

#Plot 6
LA_motor <- balti[which(lala$SCC %in% f2motor$SCC), ]
