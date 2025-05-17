#' Deal a Blackjack Hand
#'
#' Deals cards from a given deck and removes them from the deck.
#'
#' @param deck A character vector representing the current deck (e.g., output of `create_shuffled_deck()`)
#' @param n Number of cards to deal (default = 2)
#'
#' @return A list with:
#' \describe{
#'   \item{hand}{Character vector of dealt cards (length = n)}
#'   \item{deck}{The updated deck after removing dealt cards}
#' }
#' @export
deal_hand <- function(deck, n = 2) {
  if (length(deck) < n) stop("Not enough cards left in the deck to deal.")
  hand <- deck[1:n]
  remaining_deck <- deck[-(1:n)]
  return(list(hand = hand, deck = remaining_deck))
}
