deal_hand <- function(deck, n = 1) {
  # Reshuffle the deck after 75% of the cards have been dealt
  if (length(deck) < 52) {
    cat("Reshuffle cards...\n")
    deck <- create_shuffled_deck_new()
  }
  hand           <- deck[1:n]
  remaining_deck <- deck[-(1:n)]
  
  list(hand = hand, deck = remaining_deck)
}