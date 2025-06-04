#' Deal a Blackjack Hand
#'
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
#'
#' @examples
#' # Create a new shuffled deck
#' deck <- create_shuffled_deck()
#'
#' # Deal 2 cards
#' result <- deal_hand(deck, 2)
#' result$hand          # Show dealt cards
#' length(result$deck)  # Deck should have 2 fewer cards
#'
#' # Deal 1 more card
#' next_result <- deal_hand(result$deck, 1)
#' next_result$hand
#'
#' @export
deal_hand <- function(deck, n = 1) {
  if (length(deck) < 52) {
    cat("Reshuffle cards...\n")
    deck <- create_shuffled_deck()
  }
  hand           <- deck[1:n]
  remaining_deck <- deck[-(1:n)]

  list(hand = hand, deck = remaining_deck)
}
