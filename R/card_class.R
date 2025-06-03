# R file: R/card_class.R

#' Create a Card Vector
#'
#' @description
#' Constructs a custom card vector object using vctrs, representing card ranks and suits.
#'
#' @param rank Character vector of card ranks (e.g., "A", "2", ..., "K").
#' @param suit Character vector of suits (e.g., "♠", "♥", "♦", "♣").
#' @return An object of class `card`.
#' @export
card <- function(rank, suit) {
  stopifnot(length(rank) == length(suit))
  vctrs::new_rcrd(list(rank = rank, suit = suit), class = "card")
}

#' @export
format.card <- function(x, ...) {
  paste0(field(x, "rank"), field(x, "suit"))
}

#' @export
vec_ptype2.card.card <- function(x, y, ...) card(character(), character())

#' @export
vec_cast.card.card <- function(x, to, ...) card(field(x, "rank"), field(x, "suit"))

#' Get Suit of Card
#' @export
card_suit <- function(x) {
  UseMethod("card_suit")
}
#' @export
card_suit.card <- function(x) {
  field(x, "suit")
}

#' Get Rank of Card
#' @export
card_rank <- function(x) {
  UseMethod("card_rank")
}
#' @export
card_rank.card <- function(x) {
  field(x, "rank")
}

#' Check if Card is a Face Card (J, Q, K)
#' @export
card_is_face <- function(x) {
  UseMethod("card_is_face")
}
#' @export
card_is_face.card <- function(x) {
  field(x, "rank") %in% c("J", "Q", "K")
}
