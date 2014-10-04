#Loading the required packages
require("twitteR")

#Search Twitter for the following a particular hashtag
#Get the count of the number of times that #hashtag was used during that time frame

#Limitation : You can only retrieve 1500 tweets per query
#I also recommend you to run the setup_3_twitteR.R before executing any commands in this file

#Graphics
install.packages("ggplot2")
library("ggplot2")

#PM Narendra Modi's US Schedule
#September - mentoning 1 important event per day
#27 - UNGA Address
#28 - #ModiAtMadison
#29 - Council of Foreign Relations
#30 - US President Barack Obama at the White House

install.packages("stringr")
library("stringr")

#Load Source Files
source("/home/kartik/Desktop/R-Statistical-Computing/twitteR/get_tweets.R")
source("/home/kartik/Desktop/R-Statistical-Computing/twitteR/munge_tweets.R")
source("/home/kartik/Desktop/R-Statistical-Computing/twitteR/utilities.R")

#Get Tweets defined in get_tweets.R
df = GetTweetsBySearch("#ModiInUS")
#Save that data in a file so that you can load it later
save(df, file="/home/kartik/Desktop/R-Statistical-Computing/twitteR/df.Rda")
#load("/home/kartik/Desktop/R-Statistical-Computing/twitteR/df.Rda")

#Pre Processing Function
df = PreprocessTweets(df)
str(df)

require(ggplot2)
require(reshape2)

countTweets <- GetTweetCountTable(df, "from_user")
countRetweets <- GetTweetCountTable(df, "retweet_from")
countReplies <- GetTweetCountTable(df, "reply_to")

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
