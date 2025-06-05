#' @importFrom vctrs
NULL
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
card_value <- function(x) {
  UseMethod("card_value")
}

#' @export
card_value.character <- function(x) {
  values <- c(
    `2`  = 2,  `3`  = 3,  `4`  = 4,  `5`  = 5,  `6`  = 6,
    `7`  = 7,  `8`  = 8,  `9`  = 9, `10` = 10,
    J    = 10,  Q    = 10,  K    = 10,  A    = 11
  )
  ranks <- sub(".$", "", x)
  vals  <- unname(values[ranks])
  total <- sum(vals, na.rm = TRUE)
  n_aces <- sum(ranks == "A")
  while (total > 21L && n_aces > 0L) {
    total  <- total - 10L
    n_aces <- n_aces - 1L
  }
  total
}

#' @export
card_value.card <- function(x) {
  values <- c(
    `2`  = 2,  `3`  = 3,  `4`  = 4,  `5`  = 5,  `6`  = 6,
    `7`  = 7,  `8`  = 8,  `9`  = 9, `10` = 10,
    J    = 10,  Q    = 10,  K    = 10,  A    = 11
  )
  card_strings <- field(x, "name")
  ranks        <- sub(".$", "", card_strings)
  vals         <- unname(values[ranks])
  total        <- sum(vals, na.rm = TRUE)
  n_aces       <- sum(ranks == "A")
  while (total > 21L && n_aces > 0L) {
    total  <- total - 10L
    n_aces <- n_aces - 1L
  }
  total
}

#' @export
card_value.default <- function(x) {
  stop("`card_value() was not built to handle this class yet '", class(x)[1], "'.")
}
