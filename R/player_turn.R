player_turn <- function(player_hand, deck) {
  stand <- FALSE
  total <- card_value(player_hand)

  while (!stand && total < 22) {
    cat("Your hand:", paste(player_hand, collapse = " "), " (Total =", total, ")\n")

    action <- tolower(readline("Hit (h) or stand (s)? "))
    if (action == "hit" | action == "h") {
      new_card   <- deck[1]
      deck       <- deck[-1]
      player_hand <- c(player_hand, new_card)

      total <- card_value(player_hand)

      cat("You drew", new_card, "\n")

    } else if (action == "stand" | action == "s") {
      stand <- TRUE
      cat("You stand at", total, "\n")

    } else {
      cat("Invalid choice — please type ‘hit’, 'h' or ‘stand’, 's'.\n")
    }
  }

  list(hand = player_hand, deck = deck, total = total)
}
