#' Deal hands to multiple blackjack players
#'
#' Randomly draw 2 cards to each player from a shared shuffled deck
#'
#' @param shuffled_deck A character vector of shuffled cards like "10♥", "A♠"
#' @param n_players Number of players to deal hands to
#'
#' @return A list with:
#' \describe{
#'   \item{hands}{A named list of player hands}
#'   \item{shuffled_deck}{The remaining cards after dealing}
#' }
#'
#' @export
deal_multi_hand <- function(shuffled_deck, n_players) {
  if (n_players * 2 > length(shuffled_deck)) {
    stop("Not enough cards in deck to deal to all players.")
  }

  hands <- list()
  for (i in 1:n_players) {
    hands[[paste0("Player_", i)]] <- shuffled_deck[1:2]
    shuffled_deck <- shuffled_deck[-(1:2)]
  }

  list(hands = hands, deck = shuffled_deck)
}
