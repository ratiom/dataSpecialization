setwd("C:/Users/Conor/git/dataSpecialization/")
library(data.table)

q1DF <- data.table(q1csv)
#question1
q1DF_val <- q1DF[q1DF$VAL=="24"]
#Ans = 53

#q2
Tidy data has one variable per column. 

#q3
library(xlsx)
fileURL3 <- ("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx")
#for some reason xlsx doesnt work with my version of RStudio
#Use R instead, colIndex=colIndex, rowIndex=rowIndex etc
dat <- read.xlsx(fileURL3, sheetIndex=1)
#Answer = 36534720

#q4
library(XML)
fileURL <- ("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml")
doc <- xmlTreeParse(fileURL,useInternal=TRUE)
rootNODE <- xmlRoot(doc)
zips <- xpathSApply(rootNODE, "//row[zipcode='21231']", xmlValue)

#q5
fileURL <- ("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv")
DT <- fread(fileURL)
race = 1000
meas_tapply <- system.time(replicate(race,sapply(split(DT$pwgtp15,DT$SEX),mean)))
# not sure, this didnt give the right answer for me, but didn't test all of the functions
#The answer is not "mean(DT$pwgtp15,by=DT$SEX)"
#The answer is not "tapply(DT$pwgtp15,DT$SEX,mean)"
#The answer is not "mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)"