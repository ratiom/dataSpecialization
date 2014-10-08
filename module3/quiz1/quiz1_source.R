q1DF <- data.table(q1csv)
#question1
q1DF_val <- q1DF[q1DF$VAL=="24"]

#q3
library(xlsx)
#for some reason xlsx doesnt work with my version of RStudio
#Use R instead, colIndex=colIndex, rowIndex=rowIndex etc

#q4
library(XML)
fileURL <- ("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml")
doc <- xmlTreeParse(fileURL,useInternal=TRUE)
rootNODE <- xmlRoot(doc)
zips <- xpathSApply(rootNODE, "//li[@zipcode='21231']",xmlValue)