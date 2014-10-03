install.packages("twitteR", dependencies = "T")
library("twitteR")

#Installing other packages
install.packages(c("devtools", "rjson", "bit64", "httr"))
install.packages("ROAuth")
library("devtools")
library("rjson")
library("httr")
library("plyr")

#Download the GitHub Repo - twitteR
install_github("twitteR", username="geoffjentry")

require("twitteR")
require("ROAuth")

#oauth_endpoints("twitter")
#myapp <- oauth_app("twitter", key = "4XfsvIxdWGRnNVZazfrnZ9nP2")
#twitter_token <- oauth1.0_token(oauth_endpoints("twitter"), myapp)
#req <- GET("https://api.twitter.com/1.1/statuses/home_timeline.json",
#          config(token = twitter_token))
#stop_for_status(req)
#content(req)

api_key    = "4XfsvIxdWGRnNVZazfrnZ9nP2"
api_secret = "qKGvEMQ10CkLMKWUEDWruQuDQjMXsABzVfKg6YLSSO9UENcVeK"

download.file(url="http://curl.haxx.se/ca/cacert.pem", destfile="cacert.pem")

TwitterOAuth<-function(){
  api_key    = "4XfsvIxdWGRnNVZazfrnZ9nP2"
  api_secret = "qKGvEMQ10CkLMKWUEDWruQuDQjMXsABzVfKg6YLSSO9UENcVeK"
  
  reqURL   <- "https://api.twitter.com/oauth/request_token"
  accessURL<- "https://api.twitter.com/oauth/access_token"
  authURL  <- "https://api.twitter.com/oauth/authorize"
  twitCred <- OAuthFactory$new(consumerKey=api_key,
                               consumerSecret=api_secret,
                               requestURL=reqURL,
                               accessURL=accessURL,
                               authURL=authURL)
  
  setup_twitter_oauth(consumerKey=api_key,
                      consumerSecret=api_secret,
                      requestURL=reqURL,
                      accessURL=accessURL,
                      authURL=authURL)
  
  options(RCurlOptions = list(cainfo = system.file("CurlSSL", 
                                                   "cacert.pem", 
                                                   package = "RCurl")))
  
  #twitCred$handshake(cainfo="cacert.pem")
  
  #registerTwitterOAuth(twitCred)
}

TwitterOAuth()
