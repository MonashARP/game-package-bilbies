dealer_turn_smart <- function(dealer_hand, player_hand, deck) {
  # If the player already busted, dealer then not draw cards since dealer already win
  if (card_value(player_hand) > 21) {
    return(list(
      hand  = dealer_hand,
      deck  = deck,
      total = card_value(dealer_hand)
    ))
  }

  # 1. Otherwise, keep drawing while:
  # - dealer under 17, or
  # - dealer is still behind the player
  while (
    card_value(dealer_hand) < 17 ||
    (card_value(dealer_hand) == 17 && sum(card_value(dealer_hand) == 11) > 0) ||
    card_value(dealer_hand) < card_value(player_hand)
  ) {
    res         <- deal_hand(deck, 1)
    dealer_hand <- c(dealer_hand, res$hand)
    deck        <- res$deck
  }

  # Return final hand, deck, and total
  list(
    hand  = dealer_hand,
    deck  = deck,
    total = card_value(dealer_hand)
  )
}
