rankall <- function(outcome, num){
        ##subset data frame by "state"
        s <- read.csv("outcome-of-care-measures.csv", na.strings="Not Available", colClasses = "character")
        state_list <- unique(s$State)
        max_surted <- data.frame(matrix(ncol = 2))
        if(outcome == "heart attack"){
               for(i in state_list){
                       stert <- subset(s, s$State == i)
                       surted <- stert[order(as.numeric(stert$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack), stert$Hospital.Name),]
                       vector <- c(surted$Hospital.Name[num], i)
                       max_surted <- rbind(max_surted, vector)
                       
               }
        }
        else if(outcome == "heart failure"){
               for(i in state_list){
                       stert <- subset(s, s$State == i)
                       surted <- stert[order(as.numeric(stert$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure), stert$Hospital.Name),]
                       vector <- c(surted$Hospital.Name[num], i)
                       max_surted <- rbind(max_surted, vector)
                       
               }
       }
       else if(outcome == "pneumonia"){
               for(i in state_list){
                       stert <- subset(s, s$State == i)
                       surted <- stert[order(as.numeric(stert$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia), stert$Hospital.Name),]
                       vector <- c(surted$Hospital.Name[num], i)
                       max_surted <- rbind(max_surted, vector)
                       
               }
       }
        colnames(max_surted) <- c("hospital", "state")
        df <- max_surted[-1,]
        print(df)        
        
}