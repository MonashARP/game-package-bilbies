#' Deal cards from the deck
#'
#' Deals `n` cards from a given deck and returns a list containing the dealt hand and the remaining deck.
#'
#' @param deck A character vector representing the current deck.
#' @param n Number of cards to deal. Default is 1.
#'
#' @return A list with two elements:
#' \describe{
#'   \item{hand}{The dealt cards.}
#'   \item{deck}{The updated deck with dealt cards removed.}
#' }
#' @export
#'
#' @examples
#' deck <- create_shuffled_deck()
#' out <- deal_hand(deck, 2)
#' out$hand
#' length(out$deck)

deal_hand <- function(deck, n = 1) {
  hand <- deck[1:n]
  deck <- deck[-(1:n)]
  list(hand = hand, deck = deck)
}

