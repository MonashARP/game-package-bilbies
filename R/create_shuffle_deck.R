#' Create a shuffled Blackjack shoe (4 decks)
#'
#' @return A character vector of 208 shuffled cards
#' @export
create_shuffled_deck <- function(noOfDecks = 4) {
  suits <- c("♠", "♥", "♦", "♣")
  ranks <- c(2:10, "J", "Q", "K", "A")
  single_deck <- paste0(
    rep(ranks, times = length(suits)),
    rep(suits, each  = length(ranks))
  )

  shoe <- rep(single_deck, times = noOfDecks)

  sample(shoe)}



