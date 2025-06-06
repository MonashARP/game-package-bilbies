#' Determine if Cards Are Face Cards
#'
#' @description
#' `card_is_face()` checks whether each card in a vctrs "card" record is a face card (Jack, Queen, or King).
#' When applied to a plain character vector, it returns the character vector unchanged, as this function was
#' specifically designed for vctrs "card" records.
#'
#' @details
#' - Specifically designed for objects of class \code{"card"} (vctrs record from \code{create_shuffled_deck()}).
#' - \code{card_is_face.card(x)} extracts the \code{is_face} field via \code{vctrs::field(x, "is_face")}.
#' - \code{card_is_face.character(x)} returns \code{x} unchanged.
#' - \code{card_is_face.default(x)} throws an error if input is not a \code{"card"} or \code{character}.
#'
#' @param x A `card` object (created by `create_shuffled_deck()`) or a character vector of card names (e.g., `"A♠"`, `"J♥"`).
#' @param ... Additional arguments passed to methods. Not used.
#' If `x` is a `card`, returns a logical vector indicating which are face cards. If `x` is character, returns it unchanged.
#'
#' @return
#' Depending on the method:
#' \describe{
#'   \item{\code{card}}{A logical vector (\code{TRUE} for each face card).}
#'   \item{\code{character}}{The input character vector, unchanged.}
#' }
#'
#' @examples
#' deck <- create_shuffled_deck()
#' card_is_face(deck)
#'
#' card_is_face(c("J♣", "9♦", "K♠"))  # Character input: unchanged
#'
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
