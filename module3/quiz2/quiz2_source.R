library(httr)
# 1. Find OAuth settings for github:
# http://developer.github.com/v3/oauth/
oauth_endpoints("github")
# 2. Register an application at https://github.com/settings/applications;
# Use any URL you would like for the homepage URL (http://github.com is fine)
# and http://localhost:1410 as the callback url
#
# Insert your client ID and secret below - if secret is omitted, it will
# look it up in the GITHUB_CONSUMER_SECRET environmental variable.
myapp <- oauth_app("github", key = "d5e0d6f79be758700e74", secret = "10cbd326d3813c825c78d46b8cab3289345f61ef")
# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
json1 <- content(req)

json2 = jsonlite::fromJSON(toJSON(json1))
#The above line gives an error in RStudio 0.97.551 - not sure why
#Eventually just got answer from str(json1)

#-----------------------
#-----------------------

#Question 2
# The sqldf package allows for execution of SQL commands on R data frames. 
# We will use the sqldf package to practice the queries we might send with the dbSendQuery command in RMySQL. 
# Download the American Community Survey data and load it into an R object called
# 
# acs
#   
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv
# 
# Which of the following commands will select only the data for the probability weights pwgtp1 with ages less than 50?
# sqldf("select * from acs")
# sqldf("select * from acs where AGEP < 50 and pwgtp1")
# sqldf("select pwgtp1 from acs")
# sqldf("select pwgtp1 from acs where AGEP < 50")

# This code has to be carried out in R console, will not work in RStudio
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
acs <- read.csv(fileURL)
library(sqldf) 
test1 <- sqldf("select * from acs")
test2 <- sqldf("select * from acs where AGEP < 50 and pwgtp1")
test3 <- sqldf("select pwgtp1 from acs")
test4 <- sqldf("select pwgtp1 from acs where AGEP < 50") # correct answer

#----------------------------------------------------------------
#----------------------------------------------------------------

# Question 3
# Using the same data frame you created in the previous problem, what is the equivalent function to unique(acs$AGEP)
# sqldf("select distinct AGEP from acs")
# sqldf("select AGEP where unique from acs")
# sqldf("select distinct pwgtp1 from acs")
# sqldf("select unique * from acs")

unique(acs$AGEP)
sqldf("select distinct AGEP from acs")

#----------------------------------------------------------------
#----------------------------------------------------------------

# Question 4
# How many characters are in the 10th, 20th, 30th and 100th lines of HTML from this page:
#         
#         http://biostat.jhsph.edu/~jleek/contact.html
# 
# (Hint: the nchar() function in R may be helpful)
# 45 31 2 25
# 45 31 7 31
# 45 92 7 2
# 45 0 2 2
# 43 99 8 6
# 43 99 7 25
# 45 31 7 25

con = url("http://biostat.jhsph.edu/~jleek/contact.html ")
htmlCode = readLines(con)
close(con)
nchar(htmlCode[100])
#etc etc

#----------------------------------------------------------------
#----------------------------------------------------------------

# Question 5
# Read this data set into R and report the sum of the numbers in the fourth of the nine columns.
# 
# https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for
# 
# Original source of the data: http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for
# 
# (Hint this is a fixed width file format)
# 101.83
# 36.5
# 222243.1
# 32426.7
# 28893.3
# 35824.9

q5URL <- ("http://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for")
q5data <- read.fwf(q5URL, widths = c(1, 9, 5, 4, 4, 5, 4, 4, 5, 4, 4, 5, 4, 4), skip = 4)
sum(q5data[,7])