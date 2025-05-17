#' Play One Round of Blackjack with Action
#'
#' This function simulates a full round of Blackjack, allowing the player to hit or stand.
#'
#' @param n_players Number of players (default is 1)
#'
#' @return A list with hands, scores, and outcome
#'
#' @export
play_blackjack_action <- function(n_players = 1) {
  # Deal two cards to the player and dealer
  player_hand <- deal_hand(2)
  dealer_hand <- deal_hand(2)

  cat("Dealer shows:", dealer_hand[1], "?\n")

  # Create a shuffled deck of cards
  deck <- create_shuffled_deck()
  # Player's turn
  player_res   <- player_turn(player_hand, deck)
  player_hand  <- player_res$hand
  deck         <- player_res$deck
  player_score <- player_res$total
  # Dealer's turn
  dealer_res <- dealer_turn(dealer_hand, deck)
  dealer_hand  <- dealer_res$hand
  deck         <- dealer_res$deck
  dealer_score <- dealer_res$total

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
