complete <- function(directory, id=1:332) {
        setwd(paste("C:/Users/Conor/git/",directory, sep=""))
        my.files <- list.files(pattern = "*.csv") #returns a character vector
        
        nobs <- NULL
        for(i in my.files[id]) {
                datum <- read.csv(i)
                sums <- sum(complete.cases(datum))
                nobs <- c(nobs, sums)
                }
        tavolo <- data.frame(cbind(id, nobs))
        print(tavolo)
}
complete("specdata", 30:25)