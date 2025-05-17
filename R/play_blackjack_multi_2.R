#' Simulate Multiplayer Blackjack (2 players)
#'
#' This function simulates a round of Blackjack for two players against a dealer.
#'
#' @param n_players Number of players (default is 2)
#'
#' @return A data frame containing the results of the game, including each player's hand, score, and result against the dealer
#'
#' @export
play_blackjack_multi_2 <- function(n_players = 2) {
  # Create a shuffled deck of cards
  deck <- create_shuffled_deck()
  # Deal two cards to dealer
  str <- deal_hand(deck, 2)
  dealer_hand <- str$hand
  deck        <- str$deck
  cat("Dealer shows:", dealer_hand[1], "?\n")

  # Create a list to hold each player's hand
  player_hands <- vector("list", n_players)

  # Deal two cards to each player
  for (i in seq_len(n_players)) {
    str <- deal_hand(deck, 2)
    player_hands[[i]] <- str$hand
    deck <- str$deck
    }

  # Create a list to hold each player's results
  player_results <- vector("list", n_players)
  # Player's turn
  for (i in seq_len(n_players)) {
    cat("Player", i, "turn:\n")
    res <- player_turn(player_hands[[i]], deck)
    player_hands[[i]] <- res$hand
    deck <- res$deck
    player_results[[i]] <- list(
      hand  = res$hand,
      score = res$total
    )
  }

  # Dealer's turn
  dealer_res <- dealer_turn(dealer_hand, deck)
  dealer_hand  <- dealer_res$hand
  deck         <- dealer_res$deck
  dealer_score <- dealer_res$total

  # Compare each player vs dealer
  get_result <- function(ps, dealer_score) {
    if      (ps > 21)            "Player busts"
    else if (dealer_score > 21)  "Dealer busts"
    else if (ps > dealer_score)  "Player wins"
    else if (dealer_score > ps)  "Dealer wins"
    else                          "Push"
  }

  # vector of player scores
  player_scores <- sapply(player_results, `[[`, "score")

  # vector of results
  player_results_vec <- mapply(get_result,
                               ps = player_scores,
                               MoreArgs = list(dealer_score = dealer_score),
                               USE.NAMES = FALSE)

  players_df <- data.frame(
    player = paste0("Player ", seq_len(n_players)),
    hand   = sapply(player_results, function(x) paste(x$hand, collapse = " ")),
    score  = player_scores,
    result = player_results_vec,
    stringsAsFactors = FALSE
  )
  return(players_df)

}


