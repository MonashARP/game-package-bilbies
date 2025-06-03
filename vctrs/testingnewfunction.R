library(vctrs)

# Extract the card’s full name
card_name <- function(x) {
  if (!inherits(x, "card")) {
    stop("`card_name()` expects an object of class 'card'.")
  }
  field(x, "name")
}

# Extract the card’s rank
card_rank <- function(x) {
  if (!inherits(x, "card")) {
    stop("`card_rank()` expects an object of class 'card'.")
  }
  field(x, "rank")
}

# Extract the card’s suit symbol
card_symbol <- function(x) {
  if (!inherits(x, "card")) {
    stop("`card_symbol()` expects an object of class 'card'.")
  }
  field(x, "suit_symbol")
}

# Extract the card’s suit word
card_suit <- function(x) {
  if (!inherits(x, "card")) {
    stop("`card_suit()` expects an object of class 'card'.")
  }
  field(x, "suit")
}

# Give true if the card is face and false otherwise
card_is_face <- function(x) {
  if (!inherits(x, "card")) {
    stop("`card_is_face()` expects an object of class 'card'.")
  }
  field(x, "is_face")
}
