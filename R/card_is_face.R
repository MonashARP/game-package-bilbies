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
