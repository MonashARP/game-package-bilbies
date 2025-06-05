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
