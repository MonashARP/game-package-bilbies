#' Automatic Player Turn Logic
#'
#' @description
#' This function simulates the player's turn in a Blackjack game.
#' The player keeps drawing cards until the total hand value reaches or exceeds a specific threshold.
#'
#' @param player_hand A vector of cards representing the player's hand.
#' @param deck A vector of cards representing the remaining deck.
#' @param threshold A numeric value representing the threshold for the player to stop drawing cards.
#'
#' @return A list containing:
#' \describe{
#'   \item{hand}{The updated player hand after drawing cards.}
#'   \item{deck}{The updated deck after removing drawn cards.}
#'   \item{total}{The final total value of the player's hand.}
#'   }
#'
#'
#' @export
auto_player_turn <- function(player_hand, deck, threshold) {
  # Draw card if player's hand value is less than threshold
  while (card_value(player_hand) < threshold) {
    str <- deal_hand(deck, 1)
    new_card <- str$hand
    deck        <- str$deck
    player_hand <- c(player_hand, new_card)
  }
  total <- card_value(player_hand)
  list(hand = player_hand, deck = deck, total = total)
}
