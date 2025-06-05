# Extract the card’s rank
card_rank <- function(x) {
  if (!inherits(x, "card")) {
    stop("`card_rank()` expects an object of class 'card'.")
  }
  field(x, "rank")
}
