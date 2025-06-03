library(vctrs)
create_shuffled_deck_new <- function(noOfDecks = 4) {
  suits       <- c("♠", "♥", "♦", "♣")
  ranks       <- c(2:10, "J", "Q", "K", "A")
  single_deck <- paste0(
    rep(ranks,     times = length(suits)),
    rep(suits, each = length(ranks))
  )
  shoe_str <- rep(single_deck, times = noOfDecks)
  shuffled <- sample(shoe_str)
  rank_text   <- sub(".$", "", shuffled)
  suit_symbol <- sub("^.*([♠♥♦♣])$", "\\1", shuffled)
  suit_name <- function(sym) {
    switch(sym,
           "♠" = "Spade",
           "♥" = "Heart",
           "♦" = "Diamond",
           "♣" = "Club",
           NA_character_
    )
  }
  suit_word <- vapply(suit_symbol, suit_name, character(1))
  is_face   <- rank_text %in% c("J", "Q", "K")
  new_rcrd(
    list(
      name        = shuffled,
      rank        = rank_text,
      suit_symbol = suit_symbol,
      suit        = suit_word,
      is_face     = is_face
    ),
    class = "card"
  )
}


format.card <- function(x, ...) {
  unclass(x)
}
print.card <- function(x, ...) {
  cat("card[", vec_size(x), "]\n", sep = "")
  df <- data.frame(
    name        = field(x, "name"),
    rank        = field(x, "rank"),
    suit_symbol = field(x, "suit_symbol"),
    suit        = field(x, "suit"),
    is_face     = field(x, "is_face"),
    stringsAsFactors = FALSE
  )
  print(utils::head(df), row.names = FALSE)
  n_rest <- vec_size(x) - nrow(utils::head(df))
  if (n_rest > 0) {
    cat(" … and", n_rest, "more cards\n")
  }
  invisible(x)
}


