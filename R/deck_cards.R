#' @title Blackjack Deck and Scoring
#' @description A full 52-card deck (multiplied to 4 decks) and scoring logic for Blackjack
#' @name deck_cards

#' Base 52-card deck (not shuffled)
#' @export
deck <- expand.grid(
  rank = as.character(c(2:10, "J", "Q", "K", "A")),
  suit = c("\u2660", "\u2665", "\u2666", "\u2663"),
  stringsAsFactors = FALSE
)

#' Card value mapping
#' @export
card_number <- c(
  "2" = 2, "3" = 3, "4" = 4, "5" = 5, "6" = 6,
  "7" = 7, "8" = 8, "9" = 9, "10" = 10,
  "J" = 10, "Q" = 10, "K" = 10, "A" = 11
)

#' Create a shuffled Blackjack shoe (4 decks)
#'
#' @return A character vector of 208 shuffled cards
#' @export
create_shuffled_deck <- function() {
  cards <- paste0(deck$rank, deck$suit)
  shoe <- rep(cards, 4)  # 4 full decks
  sample(shoe)
}

#' Score a Blackjack Hand
#'
#' Calculates total hand value, adjusting for Aces
#'
#' @param cards A character vector like "A♠", "10♥"
#' @return Total hand value (numeric)
#' @export
card_value <- function(cards) {
  ranks <- sub(".$", "", cards)
  vals <- unname(card_number[ranks])
  total <- sum(vals)
  number_of_aces <- sum(ranks == "A")
  while (total > 21 && number_of_aces > 0) {
    total <- total - 10
    number_of_aces <- number_of_aces - 1
  }
  return(total)
}
