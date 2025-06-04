#' Create a Shuffled Blackjack Shoe
#'
#' @description
#' Creates a shuffled Blackjack shoe consisting of multiple standard 52-card decks combined.
#' Each standard deck includes cards from all four suits (\code{"♠", "♥", "♦", "♣"}) and 13 ranks (\code{2–10, J, Q, K, A}).
#'
#' @param noOfDecks Integer. Number of decks to include in the shoe (default = 4). A typical Blackjack shoe contains 4 to 8 decks.
#'
#' @return A character vector representing the shuffled cards in the shoe. For example, 4 decks result in a vector of 208 elements.
#'
#' @examples
#' deck <- create_shuffled_deck()
#' length(deck)                   # Should be 208 (4 decks of 52)
#' head(deck, 5)                  # Show the top 5 cards
#'
#' deck2 <- create_shuffled_deck(noOfDecks = 6)
#' length(deck2)                 # Should be 312 (6 * 52)
#'
#' @export
create_shuffled_deck <- function(noOfDecks = 4) {
  suits <- c("♠", "♥", "♦", "♣")
  ranks <- c(2:10, "J", "Q", "K", "A")
  single_deck <- paste0(
    rep(ranks, times = length(suits)),
    rep(suits, each  = length(ranks))
  )
  shoe <- rep(single_deck, times = noOfDecks)
  sample(shoe)
}
