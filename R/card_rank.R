#' Extract Card Ranks
#'
#' @description
#' `card_rank()` retrieves the \code{rank} field from a vctrs "card" record (class \code{"card"}).
#' When applied to a plain character vector, it returns the vector unchanged. This function was
#' specifically designed to work with vctrs "card" objects created by \code{create_shuffled_deck()}.
#'
#' @details
#' - For objects of class \code{"card"}, \code{card_rank.card(x)} extracts the \code{rank} field
#'   via \code{vctrs::field(x, "rank")}, returning a character vector of card ranks (e.g., "Ace").
#' - If \code{x} is a \code{character} vector, \code{card_rank.character(x)} simply returns \code{x} unchanged.
#' - For any other class, \code{card_rank.default(x)} throws an error.
#'
#' @param x A `card` object or a character vector of card ranks (e.g., "Two", "Jack").
#' @param ... Additional arguments passed to methods. Not used.
#'
#' @return
#' Depending on the method:
#' \describe{
#'   \item{\code{card}}{A character vector containing the `rank` field of each card.}
#'   \item{\code{character}}{The input character vector, unchanged.}
#' }
#'
#' @examples
#' deck <- create_shuffled_deck()
#' card_rank(deck)
#'
#' card_rank(c("Queen", "Two", "Ace"))
#'
#' @export
card_rank <- function(x, ...) {
  UseMethod("card_rank")
}

#' @export
card_rank.card <- function(x, ...) {
  field(x, "rank")
}

#' @export
card_rank.character <- function(x, ...) {
  x
}

#' @export
card_rank.default <- function(x, ...) {
  stop("`card_rank()` only works on objects of class 'card' or plain character vectors.", call. = FALSE)
}
