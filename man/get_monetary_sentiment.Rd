% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_monetary_sentiment.R
\name{get_monetary_sentiment}
\alias{get_monetary_sentiment}
\title{Estimate Monetary Sentiment}
\usage{
get_monetary_sentiment(x, dictionary, window = 10)
}
\arguments{
\item{x}{A quanteda tokens object}

\item{dictionary}{The dictionary_monetary_sentiment (quanteda dictionary object) containing the keywords and valence shifters}

\item{window}{The tokens_lookup window to check valence shifters around the keywords. Default is 10.}
}
\description{
This function is used to take a \pkg{quanteda} tokens object and returns a \pkg{quanteda} dfm object. The function is designed to work with the sentiment dictionary from the \pkg{monetary.sentiment} package.
}
