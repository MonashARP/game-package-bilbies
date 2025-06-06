#' @useDynLib blackjack, .registration = TRUE
#' @importFrom Rcpp evalCpp
#' @importFrom vctrs vec_size
#' @name blackjack-package
NULL
#' Deal a Blackjack Hand
#'
#' @description
#' Deals cards from a given deck and removes them from the deck using C++ for performance.
#' If the deck fall below 25% of a full deck, a new shuffled deck is created which match the rule from casino.
#' @details
#' After the update, deal_hand() is now an S3 generic with methods for both card records and the old character.
#' If the user use this deal_hand() with a character vector, it will still work as before,
#' however, it lack the ability to check with create_shuffle_deck for whether the amount of cards
#' fall below 25% yet.
#' If deck inherits from class "card", it dispatch to deal_hand.card().
#' If deck is a bare character vector, it dispatch to deal_hand.character().
#' If is an unexpected class then it dispatch to deal_hand.default() which throws an error.
#'
#' @param deck A deck of cards, typically the output of create_shuffled_deck().
#' Internally, this should be a vctrs record with class "card" (each element has
#' fields name, rank, suit_symbol, suit, is_face) or a plain character vector of card names.
#' @param n Number of cards to deal (default = 2).
#'
#' @return A list with:
#' \describe{
#'   \item{hand}{Character vector or "card" record of dealt cards depend on the deck used.}
#'   \item{deck}{The updated deck after removing dealt cards.}
#' }
#'
#' @examples
#' # Create a shuffled deck and deal a hand of 2 cards
#' deck <- create_shuffled_deck()
#' result <- deal_hand(deck, 2)
#' result$hand
#' length(result$deck)
#' # Automatic reshuffle
#' small_deck <- head(create_shuffled_deck(), 6)
#' deal_hand(small_deck, 2)

#' @export
deal_hand <- function(deck, n = 2) {
  UseMethod("deal_hand")
}

#' @export
deal_hand.card <- function(deck, n = 2) {
  if (vec_size(deck) < 0.25 * vec_size(create_shuffled_deck())) {
    cat("creating new deck...\n")
    deck <- create_shuffled_deck()
  }
  out <- deal_hand_cpp(deck, n)
  list(hand = out$hand, deck = out$deck)
}

#' @export
deal_hand.character <- function(deck, n = 2) {
  hand           <- deck[1:n]
  remaining_deck <- deck[-(1:n)]
  list(hand = hand, deck = remaining_deck)
}

#' @export
deal_hand.default <- function(deck, n = 2) {
  stop("deal_hand was not designed to work with this class yet :((", class(deck)[1L],
       call. = FALSE)
}

