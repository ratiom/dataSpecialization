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
