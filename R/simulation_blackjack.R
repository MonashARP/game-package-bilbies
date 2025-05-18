simulation_blackjack <- function(n_sim = 1000) {
  threshold <- as.integer(readline("At or above what score will you stay? (enter an integer 1–21): "))
  if (is.na(threshold) || threshold < 1 || threshold > 21) {
    stop("️Error! Please enter a valid integer between 1 and 21.")
  }


  play_once <- function() {
    # 1. Create a shuffled deck and deal the initial hands
    deck <- create_shuffled_deck()
    p_hand    <- deal_hand(deck, 2);    player_hand <- p_hand$hand;    deck <- p_hand$deck
    d_hand    <- deal_hand(deck, 2);    dealer_hand <- d_hand$hand;    deck <- d_hand$deck
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
    if      (player_score > 21)    result <- "Lose"
    else if (dealer_score > 21)    result <- "Win"
    else if (player_score > dealer_score) result <- "Win"
    else if (player_score < dealer_score) result <- "Lose"
    else                            result <- "Push"

    result
  }

  # Run the simulation n_sim times and store the results
  all_matches <- replicate(n_sim, play_once())
  table(Outcome = all_matches)
}

