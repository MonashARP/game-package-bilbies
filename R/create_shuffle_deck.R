#' @importFrom vctrs new_rcrd field vec_size
NULL
#' Create a Shuffled Blackjack Shoe
#'
#' @description
#' Creates a shuffled Blackjack shoe consisting of multiple standard 52-card decks combined.
#' Each standard deck includes cards from all four suits (\code{"\u2660"}, \code{"\u2665"}, \code{"\u2666"}, \code{"\u2663"}) and 13 ranks (\code{2-10}, \code{J}, \code{Q}, \code{K}, \code{A}).
#' The function returns a vctrs class "card" record with fields: name, rank, suit_symbol, suit, and is_face.
#'
#' @details
#' The returned object is a vctrs record of class \code{"card"} using \code{vctrs::new_rcrd()}.
#' You can extract the underlying character names with \code{as.character()}, or access fields via \code{vctrs::field()}.
#' The \code{print.card()} method displays all card names, and \code{format.card()} returns the card's "name" field.
#'
#' @param noOfDecks Integer. The number of standard 52-card decks to include in the shoe. Defaults to 4.
#'
#' @return
#' A [vctrs][vctrs::new_rcrd] "card" record vector of length `52 * noOfDecks`. Each element has fields:
#' \itemize{
#'   \item \code{name} - character, e.g., "2♣", "A♠"
#'   \item \code{rank} - character, one of "Two", ..., "Ace"
#'   \item \code{suit_symbol} - character, one of "♠", "♥", "♦", "♣"
#'   \item \code{suit} - character, one of "Spade", "Heart", "Diamond", "Club"
#'   \item \code{is_face} - logical; TRUE for Jack/Queen/King, FALSE otherwise
#' }
#'
#' @examples
#' deck <- create_shuffled_deck()
#' length(deck)                   # 208 (4 decks)
#' deck                           # Prints the deck of cards
#'
#' deck2 <- create_shuffled_deck(noOfDecks = 6)
#' length(deck2)                  # 312
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
  is_face   <- rank_text %in% c("Jack", "Queen", "King")
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

