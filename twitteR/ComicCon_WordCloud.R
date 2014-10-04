#Problem Statement : Create a Word-Cloud for #ComicCon
require(twitteR)
hashtag = "#ComicCon"

#100 tweets from Twitter with the Hashtag #ComicCon
tweets = searchTwitter(hashtag,n = 100)

#Put the list of tweets into a Dataframe
tweets_df = twListToDF(tweets)

#Pattern Replacement
#Replace "@" with ""
tweets_emp = gsub("@\\w+", "", tweets_df)

#WordCloud Scripts - Pre built
generateCorpus= function(df,my.stopwords=c()){
  #Install the textmining library
  install.packages("tm")
  require(tm)
  #The following is cribbed and seems to do what it says on the can
  tw.corpus= Corpus(VectorSource(df))
  # remove punctuation
  tw.corpus = tm_map(tw.corpus, removePunctuation)
  #normalise case
  tw.corpus = tm_map(tw.corpus, tolower)
  # remove stopwords
  tw.corpus = tm_map(tw.corpus, removeWords, stopwords('english'))
  tw.corpus = tm_map(tw.corpus, removeWords, my.stopwords)
  
  tw.corpus
}

wordcloud.generate=function(corpus,min.freq=3){
  install.packages("wordcloud")
  require(wordcloud)
  doc.m = TermDocumentMatrix(corpus, control = list(minWordLength = 1))
  dm = as.matrix(doc.m)
  # calculate the frequency of words
  v = sort(rowSums(dm), decreasing=TRUE)
  d = data.frame(word=names(v), freq=v)
  #Generate the wordcloud
  wc=wordcloud(d$word, d$freq, min.freq=min.freq)
  wc
}

print(wordcloud.generate(generateCorpus(tweets_emp,'ComicCon')))

##Generate an image of the Wordcloud
png('/home/kartik/Desktop/R-Statistical-Computing/twitteR/ComicCon_WordCloud.png', width=640,height=480)
wordcloud.generate(generateCorpus(tweets_emp,'ComicCon'),7)

