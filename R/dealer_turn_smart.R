#' Smart Dealer Turn Logic
#'
#' @description
#' This function simulates the dealer's turn in a Blackjack game, where the dealer draws cards based on specific rules.
#'
#' @details
#' The dealer will keep drawing cards until:
#' - The dealer's hand value is 17 or higher.
#' - The dealer's hand value is equal to 17 but contains an Ace valued at 11.
#' - The dealer's hand value is less than the player's hand value.
#' If the player has already busted (hand value over 21), the dealer will not draw any more cards and automatically wins.
#'
#' @param dealer_hand A vector representing the dealer's current hand.
#' @param player_hand A vector representing the player's current hand.
#' @param deck A vector representing the remaining deck of cards.
#'
#' @return A list containing:
#' \describe{
#'   \item{hand}{The final dealer hand after drawing cards.}
#'   \item{deck}{The updated deck after removing drawn cards.}
#'   \item{total}{The final total value of the dealer's hand.}
#'          }
#'
#' @export
dealer_turn_smart <- function(dealer_hand, player_hand, deck) {
  # If the player already busted, dealer then not draw cards since dealer already win
  if (card_value(player_hand) > 21) {
    return(list(
      hand  = dealer_hand,
      deck  = deck,
      total = card_value(dealer_hand)
    ))
  }

  # 1. Otherwise, keep drawing while:
  # - dealer under 17, or
  # - dealer is still behind the player
  while (
    card_value(dealer_hand) < 17 ||
    (card_value(dealer_hand) == 17 && sum(card_value(dealer_hand) == 11) > 0) ||
    card_value(dealer_hand) < card_value(player_hand)
  ) {
    res         <- deal_hand(deck, 1)
    dealer_hand <- c(dealer_hand, res$hand)
    deck        <- res$deck
  }

  # Return final hand, deck, and total
  list(
    hand  = dealer_hand,
    deck  = deck,
    total = card_value(dealer_hand)
  )
}
