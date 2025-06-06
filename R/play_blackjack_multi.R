#' Simulate Multiplayer Blackjack (2 players)
#'
#' @description
#' Simulates a full round of Blackjack with \code{n_players} playing against a dealer.  Each player
#' can choose to hit or stand in turn; after all players have finished, the dealer draws according
#' to standard rules.  Finally, each player’s total is compared to the dealer’s to determine the outcome.
#' @details
#' This function use its own build-in creating_shuffle_deck to create a shuffled deck of cards,
#' and then deals two cards to all the player and the dealer. The player can then choose to hit
#' (draw another card) or stand (end their turn). After the every player's turn, the dealer will draw cards
#' according to standard Blackjack rules until they reach a score of 17 or higher. The function then
#' evaluates the scores and determines the winner. Moreover, it is not possible for the user to use
#' their custom deck instead. The function only support deck of card from the vctrs class.
#'
#' @param n_players Number of players (default is 2)
#' @param ... Additional arguments (currently unused; reserved for future extensions)
#' @param input_fn holder to obtain player actions (defaults to \code{readline}) which can be overridden to inject fake input for unit tests or if the user want to add fake actions.
#'
#' @return
#' A \code{data.frame} with one row per player and these columns:
#' \describe{
#'   \item{\code{player}}{Character, e.g.\ “Player 1”, “Player 2”, ….}
#'   \item{\code{hand}}{Character: the player’s final cards, space-separated (e.g.\ “A♠ 10♦ 3♣”).}
#'   \item{\code{score}}{Integer: total value of the player’s hand.}
#'   \item{\code{result}}{Character: one of “Player busts,” “Dealer busts,” “Player wins,”
#'                        “Dealer wins,” or “Push.”}
#' }
#' @examples
#' # Simulate a game with 2 players using automatic decisions
#' play_blackjack_multi() # Defaults to 2 players
#' # Player 1's turn
#' # Hit (h) or stand (s)?
#' # Player 2's turn
#' # Hit (h) or stand (s)?
#' # Example of using a custom input function to simulate player actions
#' play_blackjack_multi(n_players = 2, input_fn = function(...) "h") # Both player hit until burst
#' @export
play_blackjack_multi <- function(n_players = 2, input_fn = readline, ...) {
  # Create a shuffled deck of cards
  deck <- create_shuffled_deck()

  # Create a list to hold each player's hand
  player_hands <- vector("list", n_players)
  # Deal two cards to each player
  for (i in seq_len(n_players)) {
    str <- deal_hand(deck, 2)
    player_hands[[i]] <- str$hand
    deck <- str$deck
  }

  # Deal two cards to dealer
  str <- deal_hand(deck, 2)
  dealer_hand <- str$hand
  deck        <- str$deck
  print(paste("Dealer shows:", format(dealer_hand[1]), "?"), quote = FALSE)

  # Create a list to hold each player's results
  player_results <- vector("list", n_players)
  # Player's turn
  for (i in seq_len(n_players)) {
    print(paste("Player", i, "turn:"), quote = FALSE)
    res <- player_turn(player_hands[[i]], deck, input_fn)
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
    hand   = sapply(player_results, function(x) paste(format(x$hand), collapse = " ")),
    score  = player_scores,
    result = player_results_vec,
    stringsAsFactors = FALSE
  )
  return(players_df)
}
