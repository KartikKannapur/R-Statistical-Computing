#Loading the required packages
require("twitteR")

#Search Twitter for the following Hashtag
#--------------------------------------#
#n : Specifies the number of tweets to return
searchTwitter('#twitter', n=50)

searchTwitter('#twitter', n=10,lang = "English")

searchTwitter('#twitter', n=50,since = "2014-10-02",until = "2014-10-04")


