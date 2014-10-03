#Make Sure we have Read, Write and Access direct messages

#Install the packages
install.packages("twitteR")
install.packages("RJSONIO")
install.packages("bitops")
install.packages("RCurl")

library("twitteR")
library("RJSONIO")
library("bitops")
library("RCurl")

credential <- OAuthFactory$new(consumerKey="OSITJJnqdEupXlg3869Y0APAl",consumerSecret="3Xx60C5SEXrstVCupTYH47mky4pTz30UC84uybpqENjaiX7Shq",requestURL="https://api.twitter.com/oauth/request_token",accessURL="https://api.twitter.com/oauth/access_token",authURL="https://api.twitter.com/oauth/authorize")

credential$handshake(cainfo="cacert.pem")

registerTwitterOAuth(credential)
options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))
