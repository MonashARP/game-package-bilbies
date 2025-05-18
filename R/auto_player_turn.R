auto_player_turn <- function(player_hand, deck, threshold) {
  # Draw card if player's hand value is less than threshold
  while (card_value(player_hand) < threshold) {
    str <- deal_hand(deck, 1)
    new_card <- str$hand
    deck        <- str$deck
    player_hand <- c(player_hand, new_card)
  }
  total <- card_value(player_hand)
  list(hand = player_hand, deck = deck, total = total)
}
