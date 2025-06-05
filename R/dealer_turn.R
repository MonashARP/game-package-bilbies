#' Dealer Turn Logic
#'
#' @description
#' Simulates the dealer's decisions in Blackjack.
#'
#' @param dealer_hand The dealer's current hand
#' @param deck The current deck of cards
#'
#' @return A list with:
#' \describe{
#'   \item{hand}{The final dealer hand after drawing cards.}
#'   \item{deck}{The updated deck after removing drawn cards.}
#'   \item{total}{The final total value of the dealer's hand.}
#' }
#'
#' @examples
#' # Create a shuffled deck
#' deck <- create_shuffled_deck()
#'
#' # Deal 2 cards to the dealer
#' deal_result <- deal_hand(deck, 2)
#' dealer_hand <- deal_result$hand
#' deck <- deal_result$deck
#'
#' # Let the dealer play
#' result <- dealer_turn(dealer_hand, deck)
#' result$hand   # Final dealer hand
#' result$total  # Final score
#'
#' @export
dealer_turn <- function(dealer_hand, deck) {
  while (
    card_value(dealer_hand) < 17 ||
    (card_value(dealer_hand) == 17 && sum(card_value(dealer_hand) == 11) > 0)
  ) {
    str <- deal_hand(deck, 1)
    new_card <- str$hand
    deck        <- str$deck
    dealer_hand <- c(dealer_hand, new_card)
  }
  total <- card_value(dealer_hand)
  print(paste("Dealer's hand:", paste(format(dealer_hand), collapse = " "), "Total:", total), quote = FALSE)
  list(hand = dealer_hand, deck = deck, total = total)
}
