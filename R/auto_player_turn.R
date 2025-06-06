#' Automatic Player Turn Logic
#'
#' @description
#' This function simulates the player's turn in a Blackjack game.
#' The player keeps drawing cards until the total hand value reaches
#' or exceeds a specific threshold.
#' @details
#' Work basically the same as dealer_turn but with threshold input by user instead of fixed 17 rule.
#' Call deal_hand() to draw card so it use the same logic from deal_turn as well
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
#' @examples
#' # 1) Start with a fresh shuffled deck:
#' deck <- create_shuffled_deck()
#'
#' # 2) Deal two cards to form the initial player hand:
#' top_two <- deal_hand(deck, 2)
#' hand <- top_two$hand
#' deck <- top_two$deck
#'
#' # 3) Now call auto_player_turn() with threshold = 17:
#' auto_player_turn(player_hand = hand, deck = deck, threshold = 17)
#' #' @export
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
