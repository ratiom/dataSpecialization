corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        setwd(paste("C:/Users/Conor/git/",directory, sep=""))
        my.files <- list.files(pattern = "*.csv")
        corrs = NULL
        for(i in my.files) {
                compl <- sum(complete.cases(read.csv(i)))
                df <- data.frame(read.csv(i))
                if(compl > threshold){
                        corrs2 <- cor(df[,2], df[,3], use = "pairwise.complete.obs")
                        corrs <- c(corrs, corrs2)
                }        
        
        }
        return(corrs)
}
cr <- corr("specdata")
