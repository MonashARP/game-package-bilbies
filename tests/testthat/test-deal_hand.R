test_that("deal_hand returns correct number of cards and updates deck", {
  deck <- create_shuffled_deck()
  result <- deal_hand(deck, 2)

  expect_type(result, "list")
  expect_named(result, c("hand", "deck"))
  expect_length(result$hand, 2)
  expect_length(result$deck, length(deck) - 2)

  # Check that counts of cards have decreased properly
  orig_counts <- table(deck)
  hand_counts <- table(result$hand)
  new_counts <- table(result$deck)

  # For all cards in hand, check that updated deck has correct reduced counts
  for (card in names(hand_counts)) {
    expect_equal(orig_counts[card], hand_counts[card] + new_counts[card])
  }
})

test_that("dealer_turn draws until ≥17 when starting very low", {
  # Create a deck of 5 cards
  deck <- rep("5♠", 208)

  # Start the dealer at 11, and make the player score 16 and they stand
  dealer_hand <- c("7♠", "5♥")
  player_hand <- c("10♠", "6♠")

  result <- dealer_turn(dealer_hand, deck)

  # Dealer:  11 + 5 + 5 = 21
  expect_equal(result$total, 17L)
  expect_length(result$hand, 3L)
  expect_length(result$deck, 207L)
})
