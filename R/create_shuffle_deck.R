#' @importFrom vctrs new_rcrd field vec_size
NULL
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
  suits       <- c("♠", "♥", "♦", "♣")
  ranks       <- c(2:10, "J", "Q", "K", "A")
  single_deck <- paste0(
    rep(ranks,     times = length(suits)),
    rep(suits, each = length(ranks))
  )
  shoe_str <- rep(single_deck, times = noOfDecks)
  shuffled <- sample(shoe_str)
  # 1) Extract the “raw” rank codes: "2","3",…,"10","J","Q","K","A"
  raw_rank <- sub(".$", "", shuffled)

  # 2) Map each raw_rank → English word
  #    We define a small helper function, then vectorize via vapply.
  rank_to_word <- function(r) {
    switch(r,
           "2"  = "Two",
           "3"  = "Three",
           "4"  = "Four",
           "5"  = "Five",
           "6"  = "Six",
           "7"  = "Seven",
           "8"  = "Eight",
           "9"  = "Nine",
           "10" = "Ten",
           "J"  = "Jack",
           "Q"  = "Queen",
           "K"  = "King",
           "A"  = "Ace",
           NA_character_
    )
  }
  rank_text <- unname(vapply(raw_rank, rank_to_word, character(1)))
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
  suit_word <- unname(vapply(suit_symbol, suit_name, character(1)))
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

#' @export
format.card <- function(x, ...) {
  field(x, "name")
}

#' @export
print.card <- function(x, ...) {
  cat("card[", vec_size(x), "]\n", sep = "")
  card_names <- field(x, "name")
  cat(paste(card_names, collapse = " "), "\n")
  invisible(x)
}

#' @export
as.character.card <- function(x, ...) {
  format(x)
}

