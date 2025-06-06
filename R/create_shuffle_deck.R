#' @importFrom vctrs new_rcrd field vec_size
NULL
#' Create a Shuffled Blackjack Shoe
#'
#' @description
#' Creates a shuffled Blackjack shoe consisting of multiple standard 52-card decks combined.
#' Each standard deck includes cards from all four suits (\\code{"\\u2660", "\\u2665", "\\u2666", "\\u2663"}) and 13 ranks (\\code{2-10, J, Q, K, A}).
#' The function has been updated to include a vctrs class "card" record with fields: name, rank, suit_symbol, suit, and is_face.
#' `name` is the card's name, `rank` is the English word for the rank, `suit_symbol` is the Unicode symbol for the suit,
#' `suit` is the English word for the suit, and `is_face` indicates if the card is a face card (Jack, Queen, King).
#'
#' @details
#' Because we use vctrs::new_rcrd(...), the returned object is a vctrs record with class card. You can extract the underlying
#' character names with as.character(), or access fields via vctrs::field(). The print.card() method will display all card names,
#' and format.card() returns the card's "name" field.
#'
#' @return
#' A [vctrs][vctrs::new_rcrd] "card" record vector of length `52 * noOfDecks`. Each element is an S3 object of class "card" with these fields:
#' \itemize{
#'   \item \code{name}       - character, e.g. "2\\u2663", "A\\u2660"
#'   \item \code{rank}       - character, one of "Two", "Three", ..., "Ace"
#'   \item \code{suit_symbol}- character, one of "\\u2660", "\\u2665", "\\u2666", "\\u2663"
#'   \item \code{suit}       - character, one of "Spade", "Heart", "Diamond", "Club"
#'   \item \code{is_face}    - logical; TRUE for Jack/Queen/King, FALSE otherwise
#' }

#' After update, the creating_shuffle_deck now able to return a vctrs record with the above fields instead of just a character vector.
#' @examples
#' deck <- create_shuffled_deck()
#' length(deck)                   # Should be 208 (4 decks of 52 as default setting)
#' deck                           # Prints the deck of cards
#' deck2 <- create_shuffled_deck(noOfDecks = 6)
#' length(deck2)                 # Should be 312 (6 * 52)
#'
#' @export
create_shuffled_deck <- function(noOfDecks = 4) {
  suits <- c("\u2660", "\u2665", "\u2666", "\u2663")
  ranks       <- c(2:10, "J", "Q", "K", "A")
  single_deck <- paste0(
    rep(ranks,     times = length(suits)),
    rep(suits, each = length(ranks))
  )
  shoe_str <- rep(single_deck, times = noOfDecks)
  shuffled <- sample(shoe_str)
  # 1) Extract the "raw" rank codes: "2","3",...,"10","J","Q","K","A"
  raw_rank <- sub(".$", "", shuffled)

  # 2) Map each raw_rank -> English word
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
  suit_symbol <- sub("^.*([\u2660\u2665\u2666\u2663])$", "\\1", shuffled)
  suit_name <- function(sym) {
    switch(sym,
           "\u2660" = "Spade",
           "\u2665" = "Heart",
           "\u2666" = "Diamond",
           "\u2663" = "Club",
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

