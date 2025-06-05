# Extract the card’s suit word
card_suit <- function(x) {
  if (!inherits(x, "card")) {
    stop("`card_suit()` expects an object of class 'card'.")
  }
  field(x, "suit")
}
