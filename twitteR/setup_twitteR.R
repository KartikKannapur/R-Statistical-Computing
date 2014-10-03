#Application Name : twitteR_KartikKannapur

#Installing twitteR
install.packages("twitteR")
library("twitteR")

#Installing other packages
install.packages(c("devtools", "rjson", "bit64", "httr"))
install.packages("ROAuth")
library("devtools")
library("rjson")
library("httr")
library("ROAUth")

#Download the GitHub Repo - twitteR
install_github("twitteR", username="geoffjentry")

options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))


#Setup Twitter Authentication
setup_twitter_oauth("4XfsvIxdWGRnNVZazfrnZ9nP2", "qKGvEMQ10CkLMKWUEDWruQuDQjMXsABzVfKg6YLSSO9UENcVeK")

#Authentication
twitCred = OAuthFactory(consumerKey="4XfsvIxdWGRnNVZazfrnZ9nP2",
                    consumerSecret="qKGvEMQ10CkLMKWUEDWruQuDQjMXsABzVfKg6YLSSO9UENcVeK",
                    requestURL="https://api.twitter.com/oauth/request_token",
                    accessURL="https://api.twitter.com/oauth/access_token",
                    authURL="https://api.twitter.com/oauth/authorize")

#Twitter Handshake
#twitCred is the varaible name from the Authentication Step
twitCred$handshake()

#Register Your Twitter Credentials
registerTwitterOAuth(twitCred)
registerTwitterOAuth

require("twitteR")

api_key    = "4XfsvIxdWGRnNVZazfrnZ9nP2"
api_secret = "qKGvEMQ10CkLMKWUEDWruQuDQjMXsABzVfKg6YLSSO9UENcVeK"

download.file(url="http://curl.haxx.se/ca/cacert.pem", destfile="cacert.pem")

TwitterOAuth<-function(){
  reqURL   <- "https://api.twitter.com/oauth/request_token"
  accessURL<- "https://api.twitter.com/oauth/access_token"
  authURL  <- "https://api.twitter.com/oauth/authorize"
  twitCred <- OAuthFactory$new(consumerKey=api_key,
                               consumerSecret=api_secret,
                               requestURL=reqURL,
                               accessURL=accessURL,
                               authURL=authURL)
  
  options(RCurlOptions = list(cainfo = system.file("CurlSSL", 
                                                   "cacert.pem", 
                                                   package = "RCurl")))
  
  twitCred$handshake(cainfo="cacert.pem")
  
  registerTwitterOAuth(twitCred)
}

TwitterOAuth()

