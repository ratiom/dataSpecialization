rankhospital <- function(state, outcome, num){
        ##subset data frame by "state"
        s <- read.csv("outcome-of-care-measures.csv", na.strings="Not Available", colClasses = "character")
        
        if(state %in% s$State) {
                if(outcome == "heart attack"){
                        sturt <- subset(s, s$State == state)
                        surted <- sturt[order(as.numeric(sturt$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack), sturt$Hospital.Name),]
                        #note comma after order parameter to tell order which column to order by
                        wurst <- length(surted$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack[!is.na(surted$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)])
                        if(num=="worst"){
                                max_surted <- surted$Hospital.Name[wurst]
                        }
                        else if(num=="best"){
                                max_surted <- surted$Hospital.Name[1]
                        }
                        else {
                                max_surted <- surted$Hospital.Name[num]
                        }      
                        
                        print(max_surted)
                }
                else if(outcome == "heart failure"){
                        sturt <- subset(s, s$State == state)
                        surted <- sturt[order(as.numeric(sturt$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure), sturt$Hospital.Name),]
                        #note comma after order parameter to tell order which column to order by
                        wurst <- length(surted$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure[!is.na(surted$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)])
                        if(num=="worst"){
                                max_surted <- surted$Hospital.Name[wurst]
                        }
                        else if(num=="best"){
                                max_surted <- surted$Hospital.Name[1]
                        }
                        else {
                                max_surted <- surted$Hospital.Name[num]
                        }      
                        
                        print(max_surted)
                }
                
                else if(outcome == "pneumonia"){
                        sturt <- subset(s, s$State == state)
                        surted <- sturt[order(as.numeric(sturt$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia), sturt$Hospital.Name),]
                        #note comma after order parameter to tell order which column to order by
                        wurst <- length(surted$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia[!is.na(surted$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)])
                        if(num=="worst"){
                                max_surted <- surted$Hospital.Name[wurst]
                        }
                        else if(num=="best"){
                                max_surted <- surted$Hospital.Name[1]
                        }
                        else {
                                max_surted <- surted$Hospital.Name[num]
                        }      
                        
                        print(max_surted)
                }        
                else {
                        stop("invalid outcome")
                }
        }
        
        else {
                stop ("invalid state")
        }
        
}