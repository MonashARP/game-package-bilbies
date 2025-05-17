#' Player Turn Interaction
#'
#' Handles the player's turn in a Blackjack game, allowing them to hit or stand.
#'
#' @param player_hand A vector of cards representing the player's hand.
#' @param deck A vector of cards representing the remaining deck.
#'
#' @return A list containing:
#' \item{hand}{The updated player hand after the turn.}
#' \item{deck}{The updated deck after the player's turn.}
#' \item{total}{The total value of the player's hand.}
#'
#' @export
player_turn <- function(player_hand, deck) {
  stand <- FALSE
  total <- card_value(player_hand)

  while (!stand && total < 22) {
    cat("Your hand:", paste(player_hand, collapse = " "), " (Total =", total, ")\n")

    action <- tolower(readline("Hit (h) or stand (s)? "))
    if (action == "hit" | action == "h") {
      str <- deal_hand(deck, 1)
      new_card <- str$hand
      deck        <- str$deck
      player_hand <- c(player_hand, new_card)

      total <- card_value(player_hand)

      cat("You drew", new_card, "\n")

    } else if (action == "stand" | action == "s") {
      stand <- TRUE
      cat("You stand at", total, "\n")

    } else {
      cat("Invalid choice - please type 'hit', 'h' or 'stand', 's'.\n")
    }
  }

  list(hand = player_hand, deck = deck, total = total)
}
