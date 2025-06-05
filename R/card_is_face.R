# Give true if the card is face and false otherwise
card_is_face <- function(x) {
  if (!inherits(x, "card")) {
    stop("`card_is_face()` expects an object of class 'card'.")
  }
  field(x, "is_face")
}
