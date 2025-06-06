#' Determine if Cards Are Face Cards
#'
#' @description
#' `card_is_face()` checks whether each card in a vctrs "card" record is a face card (Jack, Queen, or King).
#' When applied to a plain character vector, it returns the character vector unchanged as this function was
#' specificly designed for vctrs "card" records.
#'
#' @details
#' - It was specificly designed for objects of class \code{"card"} (vctrs record produced by \code{create_shuffled_deck()}),
#'   \code{card_is_face.card(x)} extracts the \code{is_face} field via \code{vctrs::field(x, "is_face")},
#'   returning a logical vector (\code{TRUE} for Jack, Queen, King; \code{FALSE} otherwise).
#'
#' - If \code{x} is a \code{character} vector, \code{card_is_face.character(x)} simply returns \code{x}
#'   unchanged (no logical test is performed).
#'
#' - For any other class, \code{card_is_face.default(x)} throws an error indicating that only
#'   \code{"card"} or \code{character} inputs are accepted.
#'
#' @param x
#'
#' Either:
#'   \itemize{
#'     \item A vctrs “card” record (class \code{"card"}) as returned by \code{create_shuffled_deck()},
#'           or any other \code{"card"} object with an \code{is_face} field; or
#'     \item A \code{character} vector of card names (e.g.\ \samp{"A♠", "J♥", "10♦"}).
#'   }
#'   Passing a \code{"card"} record returns a logical vector indicating face cards; passing a
#'   \code{character} vector simply returns it unchanged.
#'
#' @return
#' Depending on the method:
#' \describe{
#'   \item{\code{card}}{A \code{logical} vector (same length as \code{x}), \code{TRUE} for each face card.}
#'   \item{\code{character}}{The input \code{character} vector, returned as it is.}
#' }
#' @example
#' deck <- create_shuffled_deck()
#' card_is_face(deck)
#' @export
card_is_face <- function(x, ...) {
  UseMethod("card_is_face")
}

#' @export
card_is_face.card <- function(x, ...) {
  field(x, "is_face")
}

#' @export
card_is_face.character <- function(x, ...) {
  x
}

#' @export
card_is_face.default <- function(x, ...) {
  stop("`card_is_face()` only works on objects of class 'card' or plain character vectors.", call. = FALSE)
}
