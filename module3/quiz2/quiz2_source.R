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
library(rjson)
json2 = jsonlite::fromJSON(toJSON(json1))
json3 = json2[grep("datasharing", json2$name), ]

#Answer 2013-11-07T13:25:07Z
#----------------Eventually just got answer from 

# OR:
req <- with_config(gtoken, GET("https://api.github.com/rate_limit"))
stop_for_status(req)
content(req)

#Q2
library(sqldf,  drv='SQLite')
acs<-read.csv("./data/getdata_data_ss06pid.csv")
df21 <- sqldf("select pwgtp1 from acs where AGEP < 50",  drv='SQLite')


#Q3
df22 <- sqldf("select distinct AGEP from acs", drv='SQLite')

fileurl <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlcode <- readLines(fileurl)
nchar(htmlcode[10])
#45 31 7 25

#Q5 - 32426.7
