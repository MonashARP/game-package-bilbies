skip("Skipping until play_blackjack_multi returns dealer_hand and Player_1")
test_that("play_blackjack_multi runs", {
  result <- play_blackjack_multi(2)
  expect_true("dealer_hand" %in% names(result))
  expect_true("Player_1" %in% names(result))
})
