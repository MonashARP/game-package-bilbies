dealer_turn <- function(dealer_hand, deck) {
  while (
    card_value(dealer_hand) < 17 ||
    (card_value(dealer_hand) == 17 && sum(card_value(dealer_hand) == 11) > 0)
  ) {
    new_card    <- deck[1]
    deck        <- deck[-1]
    dealer_hand <- c(dealer_hand, new_card)
  }
  total <- card_value(dealer_hand)
  cat("Dealer's hand:", paste(dealer_hand, collapse = " "), "Total:", total, "\n")

  list(hand = dealer_hand, deck = deck, total = total)
}
