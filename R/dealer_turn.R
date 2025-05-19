#' Dealer Turn Logic
#'
#'@description
#' Simulates the dealer's decisions in Blackjack.
#'
#' @param dealer_hand The dealer's current hand
#' @param deck The current deck of cards
#'
#' @return A list with:
#' \describe{
#'  \item{hand}{The dealer's final hand}
#'  \item{deck}{The remaining deck after the dealer's turn}
#'  \item{total}{The total value of the dealer's hand}
#'  }
#'
#' @export
dealer_turn <- function(dealer_hand, deck) {
  while (
    card_value(dealer_hand) < 17 ||
    (card_value(dealer_hand) == 17 && sum(card_value(dealer_hand) == 11) > 0)
  ) {
    str <- deal_hand(deck, 1)
    new_card <- str$hand
    deck        <- str$deck
    dealer_hand <- c(dealer_hand, new_card)
  }
  total <- card_value(dealer_hand)
  cat("Dealer's hand:", paste(dealer_hand, collapse = " "), "Total:", total, "\n")

  list(hand = dealer_hand, deck = deck, total = total)
}
