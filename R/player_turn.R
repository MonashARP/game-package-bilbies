#' Player Turn Interaction
#'
#' @description
#' Handles the player's turn in a Blackjack game, allowing them to hit or stand.
#' @details
#' 1. Displaying the hand:
#'
#'    Before each prompt, the function prints the player’s current hand and its total value as
#'    computed by \code{card_value(player_hand)}.  Card names are shown via \code{format(player_hand)}
#'    while also account for vctrs class.
#'
#' 2. Hit or Stand:
#'
#'    If the user types \samp{"hit"} or \samp{"h"}, the function calls \code{deal_hand(deck, 1)}
#'    to draw one card. That card is appended to \code{player_hand}, and \code{deck} is updated accordingly.
#'    If the user types \samp{"stand"} or \samp{"s"}, the loop ends and the final total is printed.
#'    Any other input triggers an “Invalid choice” message and re-prompts.
#'
#' 3. Stopping conditions:
#'    The loop continues until the player chooses to stand or their total reaches 21 or higher.
#'    When player reach 21 then the loop end immediately.
#'
#' @param player_hand A vector of cards representing the player's hand.
#' @param deck A vector of cards representing the remaining deck.
#' @param input_fn a holder to obtain player actions (defaults to \code{readline});
#' can be overridden to inject fake input for unit tests or if the user want to add fake actions.
#'
#' @return A list containing:
#' \item{hand}{The updated player hand after the turn.}
#' \item{deck}{The updated deck after the player's turn.}
#' \item{total}{The total value of the player's hand.}
#'
#' @examples
#' # Example: Player always stands immediately
#' deck <- create_shuffled_deck()
#' player_hand <- deal_hand(deck, 2)$hand
#' fake_input <- function(prompt) "stand"
#' player_turn(player_hand, deck, input_fn = fake_input)
#' @export
player_turn <- function(player_hand, deck, input_fn = readline) {
  stand <- FALSE
  total <- card_value(player_hand)

  while (!stand && total < 22) {
    print(
      paste(
        "Your hand:",
        paste(format(player_hand), collapse = " "),
        "(Total =",
        total, ")"
      ),
      quote = FALSE
    )

    action <- tolower(input_fn("Hit (h) or stand (s)? "))
    if (action == "hit" || action == "h") {
      str <- deal_hand(deck, 1)
      new_card <- str$hand
      deck        <- str$deck
      player_hand <- c(player_hand, new_card)

      total <- card_value(player_hand)

      print(paste("You drew", format(new_card)), quote = FALSE)

    } else if (action == "stand" || action == "s") {
      stand <- TRUE
      print(paste("You stand at", total), quote = FALSE)

    } else {
      print(
        "Invalid choice - please type 'hit', 'h' or 'stand', 's'.",
        quote = FALSE
      )
    }
  }

  return(list(
    hand  = player_hand,
    deck  = deck,
    total = total
  ))
}

