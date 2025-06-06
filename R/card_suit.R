#' Extract Card Suits
#'
#' @description
#' `card_suit()` retrieves the \code{suit} field from a vctrs "card" record (class \code{"card"}).
#' When applied to a plain character vector, it returns the vector unchanged. This function was
#' specifically designed to work with vctrs "card" objects created by \code{create_shuffled_deck()}.
#'
#' @details
#' - For objects of class \code{"card"}, \code{card_suit.card(x)} extracts the \code{suit} field
#'   via \code{vctrs::field(x, "suit")}, returning a character vector of card suits (e.g., "Hearts").
#' - If \code{x} is a \code{character} vector, \code{card_suit.character(x)} returns \code{x} unchanged.
#' - For other types, \code{card_suit.default(x)} throws an error.
#'
#' @param x A `card` object or a character vector of card suits (e.g., "Spade", "Heart").
#' @param ... Additional arguments passed to methods. Not used.
#'
#' @return
#' \describe{
#'   \item{\code{card}}{A character vector containing the `suit` field of each card.}
#'   \item{\code{character}}{The input character vector, unchanged.}
#' }
#'
#' @examples
#' deck <- create_shuffled_deck()
#' card_suit(deck)
#'
#' card_suit(c("Hearts", "Spades"))
#'
#' @export
card_suit <- function(x, ...) {
  UseMethod("card_suit")
}

#' @export
card_suit.card <- function(x, ...) {
  field(x, "suit")
}

#' @export
card_suit.character <- function(x, ...) {
  x
}

#' @export
card_suit.default <- function(x, ...) {
  stop("`card_suit()` only works on objects of class 'card' or plain character vectors.", call. = FALSE)
}
