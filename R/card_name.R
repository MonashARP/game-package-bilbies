#' Extract Card Names
#'
#' @description
#' `card_name()` retrieves the \code{name} field from a vctrs "card" record (class \code{"card"}).
#' When applied to a plain character vector, it returns the vector unchanged. This function was
#' specifically designed to work with vctrs "card" objects created by \code{create_shuffled_deck()}.
#'
#' @details
#' - For objects of class \code{"card"}, \code{card_name.card(x)} extracts the \code{name} field
#'   via \code{vctrs::field(x, "name")}, returning a character vector of card names (e.g., "A♠").
#' - If \code{x} is a \code{character} vector, \code{card_name.character(x)} simply returns \code{x} unchanged.
#' - For any other class, \code{card_name.default(x)} throws an error.
#'
#' @param x A `card` object or a character vector of card names.
#' @param ... Additional arguments passed to methods. Not used.
#'
#' @return
#' Depending on the method:
#' \describe{
#'   \item{\code{card}}{A character vector containing the `name` field of each card.}
#'   \item{\code{character}}{The input character vector, unchanged.}
#' }
#'
#' @examples
#' deck <- create_shuffled_deck()
#' card_name(deck)
#'
#' card_name(c("A♠", "10♦", "K♥"))
#'
#' @export
card_name <- function(x, ...) {
  UseMethod("card_name")
}

#' @export
card_name.card <- function(x, ...) {
  field(x, "name")
}

#' @export
card_name.character <- function(x, ...) {
  x
}

#' @export
card_name.default <- function(x, ...) {
  stop("`card_name()` only works on objects of class 'card' or plain character vectors.", call. = FALSE)
}
