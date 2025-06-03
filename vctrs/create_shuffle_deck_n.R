create_shuffled_deck_new <- function(noOfDecks = 4) {
  suits <- c("♠", "♥", "♦", "♣")
  ranks <- c(2:10, "J", "Q", "K", "A")
  single_deck <- paste0(
    rep(ranks,     times = length(suits)),
    rep(suits, each = length(ranks))
  )
  shoe <- rep(single_deck, times = noOfDecks)
  shuffled <- sample(shoe)
  new_vctr(shuffled, class = "card")
}

format.card <- function(x, ...) {
  unclass(x)
}



