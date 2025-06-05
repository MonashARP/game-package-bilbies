# Extract the card’s suit symbol
card_symbol <- function(x) {
  if (!inherits(x, "card")) {
    stop("`card_symbol()` expects an object of class 'card'.")
  }
  field(x, "suit_symbol")
}
