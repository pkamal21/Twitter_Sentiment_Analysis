library("SnowballC")
library("tm")
library("twitteR")
library("syuzhet")

consumer_key <- 'xxxxxxxxxxxxxxxxxxxxxxxxxx'
consumer_secret <- 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
access_token <- 'xxxxxxxxxxxxxxxxxxx-xxxxxxxxxxxxxxxxxxxxxx'
access_secret <- 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
tweets <- userTimeline('JayShettyIW', n=200)

n.tweet <- length(tweets)
tweets.df <- twListToDF(tweets)

tweets.df2 <- gsub("http.*","",tweets.df$text)
tweets.df2 <- gsub("http.*","",tweets.df2)
tweets.df2 <- gsub("#.*","",tweets.df2)
tweets.df2 <- gsub("@.*","",tweets.df2)
print(head(tweets.df2))

word.df <- as.vector(tweets.df2)

emotion.df <- get_nrc_sentiment(word.df)
emotion.df2 <- cbind(tweets.df2,emotion.df)

sent.value <- get_sentiment(word.df)
most.positive <- word.df[sent.value==max(sent.value)]

most.negative <- word.df[sent.value==min(sent.value)]

print(most.negative)
print(most.positive)
