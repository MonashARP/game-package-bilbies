#' Extract Card Suits
#'
#' @description
#' `card_suit()` retrieves the \code{suit} field from a vctrs “card” record (class \code{"card"}).
#' When applied to a plain character vector, it returns the vector unchanged. This function was
#' specifically designed to work with vctrs “card” objects created by \code{create_shuffled_deck()}.
#'
#' @details
#' - For objects of class \code{"card"}, \code{card_suit.card(x)} extracts the \code{suit} field
#'   via \code{vctrs::field(x, "suit")}, returning a character vector of card suits (e.g.\ \samp{"Hearts"}).
#'
#' - If \code{x} is a \code{character} vector, \code{card_suit.character(x)} simply returns \code{x}
#'   unchanged.
#'
#' - For any other class, \code{card_suit.default(x)} throws an error indicating that only
#'   \code{"card"} or \code{character} inputs are accepted.
#'
#' @param x
#'
#' Either:
#'
#'   \itemize{
#'     \item A vctrs “card” record (class \code{"card"}) as returned by \code{create_shuffled_deck()},
#'           or any other \code{"card"} object with a \code{suit} field; or
#'     \item A \code{character} vector of card suits (e.g.\ \samp{"Spade", "Heart", "Diamond"}).
#'   }
#'   If \code{x} is a \code{"card"} record, returns a character vector of the \code{suit} field;
#'   if \code{x} is a \code{character} vector, returns \code{x} unchanged.
#'
#' @return
#' Depending on the method:
#' \describe{
#'   \item{\code{card}}{A \code{character} vector (same length as \code{x}), containing the \code{suit}
#'                    field of each card.}
#'   \item{\code{character}}{The input \code{character} vector, returned as it is.}
#' }
#' @examples
#' deck <- create_shuffled_deck()
#' card_suit(deck)
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
