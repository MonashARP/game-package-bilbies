#' Deal a Blackjack Hand
#'
#' Randomly draw cards from the deck
#'
#' @param n Number of cards to deal (default = 2)
#' @return A character vector like "10♥", "A♠"
#' @export
deal_hand <- function(n = 2) {
  cards <- paste0(deck$rank, deck$suit)
  sample(cards, n)
}
