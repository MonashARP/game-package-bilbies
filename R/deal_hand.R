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
  if(n > length(deck)) {
    stop("not enough cards")
  }
  hand <- deck[1:n]
  deck <- deck[-(1:n)]
  list(hand = hand, deck = deck)
}
