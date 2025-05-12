#' Simulate a Blackjack Round
#'
#' Deals hands to player and dealer, scores them, and reports outcome
#'
#' @return A list with hands, scores, and outcome
#' @export
play_blackjack <- function() {
  player_hand <- deal_hand(2)
  dealer_hand <- deal_hand(2)
  player_score <- card_value(player_hand)
  dealer_score <- card_value(dealer_hand)

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
