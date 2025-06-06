#' Extract Card Suit Symbols
#'
#' @description
#' `card_symbol()` retrieves the \code{suit_symbol} field from a vctrs “card” record (class \code{"card"}).
#' When applied to a plain character vector, it returns the vector unchanged. This function was
#' specifically designed to work with vctrs “card” objects created by \code{create_shuffled_deck()}.
#'
#' @details
#' - For objects of class \code{"card"}, \code{card_symbol.card(x)} extracts the \code{suit_symbol} field
#'   via \code{vctrs::field(x, "suit_symbol")}, returning a character vector of card suit symbols
#'   (e.g.\ \samp{"♠", "♥", "♦"}).
#'
#' - If \code{x} is a \code{character} vector, \code{card_symbol.character(x)} simply returns \code{x}
#'   unchanged.
#'
#' - For any other class, \code{card_symbol.default(x)} throws an error indicating that only
#'   \code{"card"} or \code{character} inputs are accepted.
#'
#' @param x
#'
#' Either:
#'
#'   \itemize{
#'     \item A vctrs “card” record (class \code{"card"}) as returned by \code{create_shuffled_deck()},
#'           or any other \code{"card"} object with a \code{suit_symbol} field; or
#'     \item A \code{character} vector of suit symbols (e.g.\ \samp{"♠", "♥", "♦", "♣"}).
#'   }
#'   If \code{x} is a \code{"card"} record, returns a character vector of the \code{suit_symbol} field;
#'   if \code{x} is a \code{character} vector, returns \code{x} unchanged.
#'
#' @return
#' Depending on the method:
#' \describe{
#'   \item{\code{card}}{A \code{character} vector (same length as \code{x}), containing the \code{suit_symbol}
#'                    field of each card.}
#'   \item{\code{character}}{The input \code{character} vector, returned as it is.}
#' }
#' @examples
#' deck <- create_shuffled_deck()
#' card_symbol(deck)
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
