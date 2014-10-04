#Loading the required packages
require("twitteR")

#Search Twitter for the following a particular hashtag
#Get the count of the number of times that #hashtag was used during that time frame

#Limitation : You can only retrieve 1500 tweets per query
#I also recommend you to run the setup_3_twitteR.R before executing any commands in this file

#Graphics
install.packages("ggplot2")
library("ggplot2")

install.packages("stringr")
library("stringr")

#Load Source Files
source("/home/kartik/Desktop/R-Statistical-Computing/twitteR/get_tweets.R")
source("/home/kartik/Desktop/R-Statistical-Computing/twitteR/munge_tweets.R")
source("/home/kartik/Desktop/R-Statistical-Computing/twitteR/utilities.R")

#Get Tweets defined in get_tweets.R
df_gdg = GetTweetsBySearch("#gdgBangalore")
#Save that data in a file so that you can load it later
save(df_gdg, file="/home/kartik/Desktop/R-Statistical-Computing/twitteR/df_gdg.Rda")
#load("/home/kartik/Desktop/R-Statistical-Computing/twitteR/df_gdg.Rda")

#Pre Processing Function
df_gdg = PreprocessTweets(df_gdg)
str(df_gdg)

require(ggplot2)
require(reshape2)

countTweets <- GetTweetCountTable(df_gdg, "from_user")
countRetweets <- GetTweetCountTable(df_gdg, "retweet_from")
countReplies <- GetTweetCountTable(df_gdg, "reply_to")

#Distribution of Tweets per user
qplot(countTweets$count, binwidth = 1, xlab = "Number of Tweets")

# combine counts into one data frame
counts <- merge(countTweets, countRetweets, by = "user", all.x = TRUE)
counts <- merge(counts, countReplies, by = "user", all.x = TRUE)
colnames(counts) <- c("user", "tweets", "replied_to", "retweeted_by")
counts[is.na(counts)] <- 0

# melt data
counts.melt <- melt(counts, id.vars = c("user"))

# plot (Cleveland dot plot)
ggplot(counts.melt, aes(x = user, y = value, color = variable)) + geom_point() +
  coord_flip() + ggtitle("Counts of tweets, retweets, and messages") + xlab("Counts") +
  ylab("Users")
