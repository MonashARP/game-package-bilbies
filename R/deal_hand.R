#' Deal a Blackjack Hand
#'#' @useDynLib blackjack, .registration = TRUE
#' @importFrom Rcpp evalCpp
NULL

#' @description
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

deal_hand <- function(deck, n = 1) {
  # Reshuffle the deck after 75% of the cards have been dealt
  if (length(deck) < 52) {
    cat("Reshuffle cards...\n")
    deck <- create_shuffled_deck()
  }
  deal_hand_cpp(deck, n)
}
