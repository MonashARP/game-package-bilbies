#' Simulate Multiple Rounds of Blackjack
#'
#' @description
#' This function runs a simulation of a specified number of Blackjack rounds between an automated player and dealer.
#' The player uses a fixed strategy: they continue drawing cards until reaching a user-defined threshold score (between 12 and 21).
#' The dealer uses a smart strategy defined in \code{dealer_turn_smart()}.
#' @param ... Additional arguments (currently unused; reserved for future extensions)
#' @param n_sim Number of rounds to simulate (default is 1000)
#' @param threshold Numeric value between 12 and 21 indicating the score at which the player stops drawing cards (default is 16)
#' @return A frequency table summarizing the outcomes of all simulated rounds.
#' @details
#' The function prompts the user to enter a threshold between 12 and 21, representing the score at which the player will stop drawing cards.
#' In each simulated round:
#' \enumerate{
#'   \item A shuffled Blackjack shoe is created.
#'   \item Two cards are dealt to both player and dealer.
#'   \item The player automatically draws until reaching or exceeding the threshold.
#'   \item The dealer plays according to a smart strategy.
#'   \item The outcome is determined as "Win", "Lose", or "Push" (draw).
#'   }
#'
#' @export
simulation_blackjack <- function(threshold = 16, n_sim = 1000, ...) {

  if (!is.numeric(threshold) || length(threshold) != 1 ||
      threshold < 12 || threshold > 21) {
    stop("`threshold` must be a single number between 12 and 21.")
  }


  play_once <- function() {
    # 1. Create a shuffled deck and deal the initial hands
    deck <- create_shuffled_deck()
    p_hand    <- deal_hand(deck, 2)
    player_hand <- p_hand$hand
    deck <- p_hand$deck
    d_hand    <- deal_hand(deck, 2)
    dealer_hand <- d_hand$hand
    deck <- d_hand$deck
    # 2. Player's turn
    player_str   <- auto_player_turn(player_hand, deck, threshold)
    player_hand  <- player_str$hand
    deck         <- player_str$deck
    player_score <- player_str$total
    # 3. Dealer's turn
    dealer_str <- dealer_turn_smart(dealer_hand, player_hand, deck)
    dealer_hand  <- dealer_str$hand
    deck         <- dealer_str$deck
    dealer_score <- dealer_str$total
    # 4. Determine the outcome
    if (player_score > 21)
      result <- "Lose"
    else if (dealer_score > 21)
      result <- "Win"
    else if (player_score > dealer_score)
      result <- "Win"
    else if (player_score < dealer_score)
      result <- "Lose"
    else
      result <- "Push"

    result
  }

  # Run the simulation n_sim times and store the results
  all_matches <- replicate(n_sim, play_once())
  table(Outcome = all_matches)
}

