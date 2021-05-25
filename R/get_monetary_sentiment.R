#' Estimate Monetary Sentiment
#'
#' This function is used to take a \pkg{quanteda} tokens object and returns a \pkg{quanteda} dfm object. The function is designed to work with the sentiment dictionary from the \pkg{monetary.sentiment} package.
#'
#' @param x A quanteda tokens object
#' @param dictionary The dictionary_monetary_sentiment (quanteda dictionary object) containing the keywords and valence shifters
#' @param window The tokens_lookup window to check valence shifters around the keywords. Default is 10.
#' @export

get_monetary_sentiment <- function(x, dictionary, window = 10) {

  # normal behaving macro terms
  macro_normal <- tokens_keep(x, pattern = phrase(dictionary["terms_normal"]), window = 10)
  monetary_sent_normal <- tokens_lookup(macro_normal, dictionary = dictionary[c("hawk_normal", "dove_normal")]) %>%
    dfm()



  # deficit terms
  deficit_term <- tokens_keep(x, pattern = phrase(dictionary["deficit_term"]), window = 10)
  deficit_term_normal <- tokens_lookup(deficit_term, dictionary = dictionary[c("deficit_hawk", "deficit_dove")]) %>%
    dfm()




  # inflation terms
  inflation_term <- tokens_keep(x, pattern = phrase(dictionary["inflation_term"]), window = 10)
  inflation_term_normal <- tokens_lookup(inflation_term, dictionary = dictionary[c("inflation_hawk", "inflation_dove")]) %>%
    dfm()




  # unemployment terms
  unemp_term <- tokens_keep(x, pattern = phrase(dictionary["unemp_term"]), window = 10)
  unemp_term_sent <- tokens_lookup(unemp_term, dictionary = dictionary[c("unemp_hawk", "unemp_dove")]) %>%
    dfm()



  # interest rate terms
  interest_term <- tokens_keep(x, pattern = phrase(dictionary["interest_term"]), window = 10)
  interest_term_sent <- tokens_lookup(interest_term, dictionary = dictionary[c("interest_hawk", "interest_dove")]) %>%
    dfm()


  monetary_results_final <- cbind(monetary_sent_normal, deficit_term_normal, inflation_term_normal, unemp_term_sent, interest_term_sent)

  return(monetary_results_final)
}
