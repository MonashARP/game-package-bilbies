#' Play One Round of Blackjack with Action
#'
#' @description
#' This function simulates a full round of Blackjack, allowing the player to hit or stand.
#' @param ... Additional arguments (currently unused; reserved for future extensions)
#' @param input_fn holder to obtain player actions (defaults to \code{readline}) which can be overridden to inject fake input for unit tests or if the user want to add fake actions.
#' @return A list containing the player's hand, dealer's hand, scores, and the result of the game.
#' @export
play_blackjack <- function(..., input_fn = readline) {
  # Create a shuffled deck of cards
  deck <- create_shuffled_deck()

  # Deal two cards to the player
  str <- deal_hand(deck, 2)
  player_hand <- str$hand
  deck        <- str$deck
  # Deal two cards to the dealer
  str <- deal_hand(deck, 2)
  dealer_hand <- str$hand
  deck        <- str$deck

  cat("Dealer shows:", dealer_hand[1], "?\n")


  # Player's turn
  str   <- player_turn(player_hand, deck, input_fn)
  player_hand  <- str$hand
  deck         <- str$deck
  player_score <- str$total
  # Dealer's turn
  str <- dealer_turn(dealer_hand, deck)
  dealer_hand  <- str$hand
  deck         <- str$deck
  dealer_score <- str$total

  result <- if (player_score > 21) {
    "Player busts"
  } else if (dealer_score > 21) {
    "Dealer busts"
  } else if (player_score > dealer_score) {
    "Player wins"
  } else if (dealer_score > player_score) {
    "Dealer wins"
  } else {
    "Push"
  }

  list(
    player_hand = player_hand,
    dealer_hand = dealer_hand,
    player_score = player_score,
    dealer_score = dealer_score,
    result = result
  )
}
