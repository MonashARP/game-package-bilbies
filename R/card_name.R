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
