#' Extract Card Suit Symbols
#'
#' @description
#' `card_symbol()` retrieves the \code{suit_symbol} field from a vctrs "card" record (class \code{"card"}).
#' When applied to a plain character vector, it returns the vector unchanged. This function was
#' specifically designed to work with vctrs "card" objects created by \code{create_shuffled_deck()}.
#'
#' @details
#' - For objects of class \code{"card"}, \code{card_symbol.card(x)} extracts the \code{suit_symbol} field
#'   via \code{vctrs::field(x, "suit_symbol")}, returning a character vector of card suit symbols
#'   (e.g., "♠", "♥", "♦").
#' - If \code{x} is a \code{character} vector, \code{card_symbol.character(x)} simply returns \code{x} unchanged.
#' - For any other class, \code{card_symbol.default(x)} throws an error.
#'
#' @param x A `card` object (created by `create_shuffled_deck()`) or a character vector of suit symbols (e.g., "♠", "♥").
#' @param ... Additional arguments passed to methods. Not used.
#'
#' @return
#' Depending on the method:
#' \describe{
#'   \item{\code{card}}{A character vector containing the `suit_symbol` field of each card.}
#'   \item{\code{character}}{The input character vector, unchanged.}
#' }
#'
#' @examples
#' deck <- create_shuffled_deck()
#' card_symbol(deck)
#'
#' card_symbol(c("♠", "♦", "♣"))
#'
#' @export
card_symbol <- function(x, ...) {
  UseMethod("card_symbol")
}

#' @export
card_symbol.card <- function(x, ...) {
  field(x, "suit_symbol")
}

#' @export
card_symbol.character <- function(x, ...) {
  x
}

#' @export
card_symbol.default <- function(x, ...) {
  stop("`card_symbol()` only works on objects of class 'card' or plain character vectors.", call. = FALSE)
}
