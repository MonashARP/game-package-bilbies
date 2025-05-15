player_turn <- function(player_hand, deck) {
  stand <- FALSE
  total <- card_value(player_hand)

  while (!stand && total < 22) {
    cat("Your hand:", paste(player_hand, collapse = " "), " (Total =", total, ")\n")

    action <- tolower(readline("Hit or stand? "))
    if (action == "hit") {
      new_card   <- deck[1]
      deck       <- deck[-1]
      player_hand <- c(player_hand, new_card)

      total <- card_value(player_hand)

      cat("You drew", new_card, "\n")

    } else if (action == "stand") {
      stand <- TRUE
      cat("You stand at", total, "\n")

    } else {
      cat("Invalid choice — please type ‘hit’ or ‘stand’.\n")
    }
  }

  list(hand = player_hand, deck = deck, total = total)
}
