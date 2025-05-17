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
