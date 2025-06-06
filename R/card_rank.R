#' Extract Card Ranks
#'
#' @description
#' `card_rank()` retrieves the \code{rank} field from a vctrs “card” record (class \code{"card"}).
#' When applied to a plain character vector, it returns the vector unchanged. This function was
#' specifically designed to work with vctrs “card” objects created by \code{create_shuffled_deck()}.
#'
#' @details
#' - For objects of class \code{"card"}, \code{card_rank.card(x)} extracts the \code{rank} field
#'   via \code{vctrs::field(x, "rank")}, returning a character vector of card ranks (e.g.\ \samp{"Ace"}).
#'
#' - If \code{x} is a \code{character} vector, \code{card_rank.character(x)} simply returns \code{x}
#'   unchanged.
#'
#' - For any other class, \code{card_rank.default(x)} throws an error indicating that only
#'   \code{"card"} or \code{character} inputs are accepted.
#'
#' @param x
#' Either:
#'
#'   \itemize{
#'     \item A vctrs “card” record (class \code{"card"}) as returned by \code{create_shuffled_deck()},
#'           or any other \code{"card"} object with a \code{rank} field; or
#'     \item A \code{character} vector of card ranks (e.g.\ \samp{"Two", "Jack", "Queen"}).
#'   }
#'   If \code{x} is a \code{"card"} record, returns a character vector of the \code{rank} field;
#'   if \code{x} is a \code{character} vector, returns \code{x} unchanged.
#'
#' @return
#' Depending on the method:
#' \describe{
#'   \item{\code{card}}{A \code{character} vector (same length as \code{x}), containing the \code{rank}
#'                    field of each card.}
#'   \item{\code{character}}{The input \code{character} vector, returned as it is.}
#' }
#' @examples
#' deck <- create_shuffled_deck()
#' card_rank(deck)
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
