#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
List deal_hand_cpp(CharacterVector deck, int n = 1) {
  // Extract the first n cards from the deck as hand
  CharacterVector hand = deck[Rcpp::Range(0, n - 1)];
  // Create vector to hold the remaining cards
  CharacterVector remaining_deck(deck.size() - n);

  // Fill the remaining_deck with the rest of the cards
  for (int i = 0; i < remaining_deck.size(); ++i) {
    remaining_deck[i] = deck[i + n];
  }

  // Return list back to R
  return List::create(
    _["hand"] = hand,
    _["deck"] = remaining_deck
  );}

