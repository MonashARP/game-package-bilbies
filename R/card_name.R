# Extract the card’s names
card_name <- function(x) {
  if (!inherits(x, "card")) {
    stop("`card_name()` expects an object of class 'card'.")
  }
  field(x, "name")
}
