pollutantmean <- function(directory, pollutant, id=1:332) {
        setwd(paste("C:/Users/Conor/git/",directory, sep=""))
        my.files <- list.files(pattern = "*.csv") #returns a character vector
        data = NULL
        for(i in my.files[id]) {
                data2 <- read.csv(i) #data is now a data frame from read.csv
                data <- rbind(data, data2)
        }
       
        means <- mean(data[[pollutant]], na.rm=TRUE)
        print(means)
}
pollutantmean("specdata", "sulfate", 1:10)
