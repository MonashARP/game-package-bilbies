#' Score a Blackjack Hand
#'
#' @description
#' Calculates the total value of a Blackjack hand. Aces are worth 11 points by default,
#' but if the total exceeds 21, Aces are downgraded to 1 point as needed to avoid busting.
#'
#' @param cards A character vector of card names such as \code{"A♠"}, \code{"10♥"}, \code{"J♦"}.
#'
#' @return A single numeric value representing the total hand score.
#'
#' @examples
#' card_value(c("10♠", "A♥"))        # 21
#' card_value(c("A♠", "A♦", "9♣"))   # 21 (11 + 1 + 9)
#' card_value(c("K♣", "7♦", "6♥"))   # 23 (bust)
#' card_value(c("5♣", "3♦", "3♥"))   # 11
#'
#' @export
card_value <- function(cards) {
  values <- c(
    `2` = 2,  `3` = 3,  `4` = 4,  `5` = 5,  `6` = 6,
    `7` = 7,  `8` = 8,  `9` = 9, `10` = 10,
    J   = 10, Q   = 10, K   = 10, A   = 11
  )
  ranks <- sub(".$", "", cards)
  vals <- unname(values[ranks])
  total <- sum(vals)
  n_aces <- sum(ranks == "A")
  while (total > 21 && n_aces > 0) {
    total <- total - 10
    n_aces <- n_aces - 1
  }
  total
}
