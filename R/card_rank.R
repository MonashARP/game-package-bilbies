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
