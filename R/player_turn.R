#' Player Turn Interaction
#'
#' @description
#' Handles the player's turn in a Blackjack game, allowing them to hit or stand.
#'
#' @param player_hand A vector of cards representing the player's hand.
#' @param deck A vector of cards representing the remaining deck.
#' @param input_fn a holder to obtain player actions (defaults to \code{readline}); can be overridden to inject fake input for unit tests or if the user want to add fake actions.
#' @return A list containing:
#' \item{hand}{The updated player hand after the turn.}
#' \item{deck}{The updated deck after the player's turn.}
#' \item{total}{The total value of the player's hand.}
#'
#' @examples
#' # Example: Player always stands immediately
#' deck <- create_shuffled_deck()
#' initial_hand <- deal_hand(deck, 2)
#' player_hand <- initial_hand$hand
#' deck <- initial_hand$deck
#'
#' # Fake input function that always returns "stand"
#' fake_input <- function(prompt) "stand"
#'
#' result <- player_turn(player_hand, deck, input_fn = fake_input)
#' print(result$hand)
#' print(result$total)
#'
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

