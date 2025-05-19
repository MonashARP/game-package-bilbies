test_that("dealer_turn_smart draws until ≥17 when starting very low", {
  # Start by give dealer a deck of cards that are all worth 10 (just to make sure not trigger reshuffle from deal_hand).
  # As a result, the dealer will suppose to bust in exactly two draws.
  deck <- rep("10♠", 208)

  # 2. Start the dealer at 2, and make the player score irrelevant (say 10)
  dealer_hand <- c("2♠")
  player_hand <- c("4♠", "6♠")      # score = 10

  result <- dealer_turn_smart(dealer_hand, player_hand, deck)

  # Dealer:  2 → +10 = 12 (still <17) → +10 = 22 → stop
  expect_equal(result$total, 22L)           # exact, deterministic
  expect_length(result$hand, 3L)           # original + 2 draws
  expect_length(result$deck, 206L)          # 208 - 2 = 206
})

test_that("dealer stands still when player is already busted", {
  # Set up player_hand busted and dealer_hand below 17
  dealer_hand <- c("7♠", "8♣")
  player_hand <- c("10♦", "8♠", "5♥")

  # Use a random deck, it should remain untouched
  deck <- c("A♠","K♣","5♦","2♥","3♣")

  # Call the function
  res <- dealer_turn_smart(dealer_hand, player_hand, deck)

  # Verify: dealer hand unchanged, deck unchanged, total unchanged
  expect_equal(res$hand, dealer_hand)
  expect_equal(res$deck, deck)
  expect_equal(res$total, card_value(dealer_hand))
})
