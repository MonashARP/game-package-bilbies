#' Simulate a Multiplayer Blackjack Round
#'
#' Deal to players and dealer, score hands, and return results.
#'
#' @param n_players Number of players
#' @return A list with dealer hand and player outcomes
#' @export
play_blackjack_multi <- function(n_players = 3) {
  deck <- create_shuffled_deck()

  dealt <- deal_multi_hand(deck, n_players)
  player_hands <- dealt$hands
  deck <- dealt$deck

  dealer_hand <- deck[1:2]
  deck <- deck[-(1:2)]

  # Dealer rule: Hit until 17+
  while (card_value(dealer_hand) < 17) {
    dealer_hand <- c(dealer_hand, deck[1])
    deck <- deck[-1]
  }

  dealer_score <- card_value(dealer_hand)
  results <- list(dealer_hand = dealer_hand, dealer_score = dealer_score)

  for (i in 1:n_players) {
    name <- paste0("Player_", i)
    hand <- player_hands[[name]]
    score <- card_value(hand)

    result <- if (score > 21) {
      "Player busts"
    } else if (dealer_score > 21 || score > dealer_score) {
      "Player wins"
    } else if (score < dealer_score) {
      "Dealer wins"
    } else {
      "Push"
    }

    results[[name]] <- list(hand = hand,
                            score = score,
                            result = result)
  }

  return(results)
}
