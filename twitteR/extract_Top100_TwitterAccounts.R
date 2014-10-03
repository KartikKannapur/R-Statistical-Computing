#Loading the required packages
require("twitteR")
require("RCurl")

#Twitter Counter gives us the Top 100 Twitter Accounts with the Most Followers
#URL : http://twittercounter.com/pages/100
top_twit <- getURL("http://twittercounter.com/pages/100")

#This will return the HTML Page Code
top_twit

#Split it into Lines
#strsplit() will split the entire document into individual lines
top_twit_lines <- unlist(strsplit(top_twit, "\n"))

#Now the idea is to get only those lines with @ in them, so that we can extract the user accounts
# Get only those lines with an @
top_twit_acc <- top_twit_lines[sapply(top_twit_lines, grepl, pattern="@","uname")]

top_100 <- gsub(".*>@(.+)<.*", "\\1", top_twit_acc)[2:101]
head(top_100)
