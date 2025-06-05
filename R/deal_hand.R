#' @useDynLib blackjack, .registration = TRUE
#' @importFrom Rcpp evalCpp
#' @name blackjack-package
NULL
#' Deal a Blackjack Hand
#'
#' Deals cards from a given deck and removes them from the deck using C++ for performance.
#'
#' @param deck A character vector representing the current deck (e.g., output of `create_shuffled_deck()`).
#' @param n Number of cards to deal (default = 2).
#'
#' @return A list with:
#' \describe{
#'   \item{hand}{Character vector of dealt cards (length = n).}
#'   \item{deck}{The updated deck after removing dealt cards.}
#' }
#'
#' @examples
#' deck <- create_shuffled_deck()
#' result <- deal_hand(deck, 2)
#' result$hand
#' length(result$deck)
#'
#' @export
deal_hand <- function(deck, n = 2) {
  if (length(deck) < n) {
    deck <- create_shuffled_deck()
  }
  out <- deal_hand_cpp(deck, n)
  list(hand = out$hand, deck = out$deck)
}

