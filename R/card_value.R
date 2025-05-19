#' Score a Blackjack Hand
#'
#' @description
#' Calculates total hand value, adjusting for Aces
#'
#' @param cards A character vector like "A♠", "10♥"
#'
#' @return Total hand value (numeric)
#'
#' @export
card_value <- function(cards) {
  # Define the values for each card rank
  values <- c(
    `2` = 2,  `3` = 3,  `4` = 4,  `5` = 5,  `6` = 6,
    `7` = 7,  `8` = 8,  `9` = 9, `10` = 10,
    J   = 10, Q   = 10, K   = 10, A    = 11
  )
  # Remove the suit from the card names
  ranks <- sub(".$", "", cards)
  # Convert to a factor to ensure correct ordering
  vals  <- unname(values[ranks])
  # Get the total value of the hand
  total <- sum(vals)
  # Adjust for Aces if total is over 21
  n_aces <- sum(ranks == "A")
  while (total > 21 && n_aces > 0) {
    total    <- total - 10
    n_aces    <- n_aces - 1
  }
  total
}

