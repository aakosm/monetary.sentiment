
# Estimating Monetary Sentiment

This package provides a monetary dictionary and appropriate function to
measure the latent dimension in central bank communications. The
dictionary is a `quanteda` dictionary object with two dimensions,
*dovish* and *hawkish*. The innovation of this dictionary is that it
contains appropriate valence shifters where they are applicable, thus
minimizing false positives. The theoretical underpinnings of the
dictionary is in Máté Á, Sebők M, Barczikay T (2021) The effect of
central bank communication on sovereign bond yields: The case of
Hungary. PLoS ONE 16(2): e0245515.
<https://doi.org/10.1371/journal.pone.0245515>

The `get_monetary_sentiment()` function is designed to work with the
dictionary and return a document feature matrix (DFM) which can be used
in the downstream analysis.

## Installing

The package is currently only available from GitHub, so it can be
installed with the `devtools::install_github()` approach.

``` r
devtools::install_github("aakosm/monetary.sentiment")
```

## Usage

The dictionary is included in the package as
`dictionary_monetary_sentiment`. The workflow was designed to integrate
into `quanteda` as demonstrated below on a small example.

``` r
library(quanteda)
library(monetary.sentiment)

# example texts
text <- c(
  "The increasing unemployment is a worrysome development that we have to monitor.", 
  "The current economic climate seems to be stable on the short to medium term.", 
  "The business sentiment is at an all times high.", 
  "The low inflation raises concerns."
)

# create tokens
monetary_toks <- corpus(text) %>% 
  tokens()

get_monetary_sentiment(monetary_toks, dictionary = dictionary_monetary_sentiment)
```
