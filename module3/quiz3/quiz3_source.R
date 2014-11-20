# Q1
fileURL <- ("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv ")
q1 <- read.csv(fileURL)
agricultureLogical <- q1[(which(q1$AGS == 6 & q1$ACR == 3)),]
head(agricultureLogical)

# Q2
install.packages("jpeg")
library(jpeg)
q2URL <- ("http://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg")
pic <- download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg", destfile = "pic.jpg", mode = "wb" )
pic2 <- readJPEG("pic.jpg", native=T)
q2quants <- quantile(pic2, probs=c(0.3,0.8))

#Q3
Q3fileURL1 <- ("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv") #remove https, replace with http
Q3fileURL2 <- ("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv")
if(!file.exists("./data")){dir.create("./data")}
download.file(Q3fileURL1,destfile="./data/gdp.csv")
download.file(Q3fileURL2,destfile="./data/ed.csv")
gdp = read.csv("./data/gdp.csv", sep=",", stringsAsFactors=F); ed <- read.csv("./data/ed.csv", sep=",", stringsAsFactors=F)
#strings as factors = False stops R from reading in numbers with commas as text...I think
gdp_cut <- gdp[5:194,] 
mergedData = merge(gdp_cut,ed,by.x="X",by.y="CountryCode")

mergedData$Gross.domestic.product.2012 <- as.numeric(mergedData$Gross.domestic.product.2012)
#this stops R ordering numbers by integer (e.g. 109 < 20 < 9)

orderByGdp <- mergedData[order(mergedData$Gross.domestic.product.2012, decreasing = T),]
orderByGdp <- arrange(mergedData, Gross.domestic.product.2012)
#alternative ways of doign the same thing

#Q4
q4tab <- mergedData[(mergedData$Income.Group == "High income: OECD"),]
q4mean1 <- mean(q4tab$Gross.domestic.product.2012)
q4tab2 <- mergedData[(mergedData$Income.Group == "High income: nonOECD"),]
q4mean2 <- mean(q4tab2$Gross.domestic.product.2012)

#Q5
library(Hmisc)
mergedData$GDPgroups = cut2(mergedData$Gross.domestic.product.2012,g=5)
#add a new column with quantiled of the GDP rank

table(mergedData$GDPgroups, mergedData$Income.Group)