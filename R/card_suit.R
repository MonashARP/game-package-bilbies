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
