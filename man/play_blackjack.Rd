% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/play_blackjack.R
\name{play_blackjack}
\alias{play_blackjack}
\title{Play One Round of Blackjack with Action}
\usage{
play_blackjack(..., input_fn = readline)
}
\arguments{
\item{...}{Additional arguments (currently unused; reserved for future extensions)}

\item{input_fn}{holder to obtain player actions (defaults to \code{readline}) which can be overridden to inject fake input for unit tests or if the user want to add fake actions.}
}
\value{
A \code{list} with these elements:
\describe{
  \item{\code{player_hand}}{Character vector (or vctrs “card” record) of the player’s final cards.}
  \item{\code{dealer_hand}}{Character vector (or vctrs “card” record) of the dealer’s final cards.}
  \item{\code{player_score}}{Integer total of the player’s hand (including ace = 1 or 11 logic).}
  \item{\code{dealer_score}}{Integer total of the dealer’s hand.}
  \item{\code{result}}{Character scalar indicating the outcome:
                       “Player busts,” “Dealer busts,” “Player wins,”
                       “Dealer wins,” or “Push.”}
}
}
\description{
This function simulates a full round of Blackjack where a player plays against a dealer. The game is
designed to be a simple interactive experience where the player can choose to hit or stand.
The function handles the dealing of cards, player actions, and dealer actions, and determines the outcome of the game.
}
\details{
This function use its own build-in creating_shuffle_deck to create a shuffled deck of cards,
and then deals two cards to both the player and the dealer. The player can then choose to hit
(draw another card) or stand (end their turn). After the player's turn, the dealer will draw cards
according to standard Blackjack rules until they reach a score of 17 or higher. The function then
evaluates the scores and determines the winner. Moreover, it is not possible for the user to use
their custom deck instead. The function only support deck of card from the vctrs class.
}
\examples{
# An example of how you play
# play_blackjack()
# The game will then ask you: "Hit (h) or stand (s)?"
# Press hit or h for hit a new card while press stand or s for stop hitting.
# Example: use a fake input to force hit until burst
play_blackjack(input_fn = function(...) "h")
}
