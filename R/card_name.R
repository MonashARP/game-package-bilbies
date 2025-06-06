#' Extract Card Names
#'
#' @description
#' `card_name()` retrieves the \code{name} field from a vctrs “card” record (class \code{"card"}).
#' When applied to a plain character vector, it returns the vector unchanged. This function was
#' specifically designed to work with vctrs “card” objects created by \code{create_shuffled_deck()}.
#'
#' @details
#'
#' - For objects of class \code{"card"}, \code{card_name.card(x)} extracts the \code{name} field
#'   via \code{vctrs::field(x, "name")}, returning a character vector of card names (e.g.\ \samp{"A♠"}).
#'
#' - If \code{x} is a \code{character} vector, \code{card_name.character(x)} simply returns \code{x}
#'   unchanged.
#'
#' - For any other class, \code{card_name.default(x)} throws an error indicating that only
#'   \code{"card"} or \code{character} inputs are accepted.
#'
#' @param x
#'
#' Either:
#'   \itemize{
#'     \item A vctrs “card” record (class \code{"card"}) as returned by \code{create_shuffled_deck()},
#'           or any other \code{"card"} object with a \code{name} field; or
#'     \item A \code{character} vector of card names (e.g.\ \samp{"A♠", "10♦", "K♥"}).
#'   }
#'   If \code{x} is a \code{"card"} record, returns a character vector of the \code{name} field;
#'   if \code{x} is a \code{character} vector, returns \code{x} unchanged.
#'
#' @return
#' Depending on the method:
#' \describe{
#'   \item{\code{card}}{A \code{character} vector (same length as \code{x}), containing the \code{name}
#'                    field of each card.}
#'   \item{\code{character}}{The input \code{character} vector, returned as it is.}
#' }
#' @examples
#' deck <- create_shuffled_deck()
#' card_name(deck)
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
