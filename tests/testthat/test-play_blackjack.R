test_that("play_blackjack returns a named list", {
  result <- play_blackjack()
  expect_type(result, "list")
  expect_named(result, c("player_hand", "dealer_hand", "player_score", "dealer_score", "result"))
})

test_that("play_blackjack returns valid scores", {
  result <- play_blackjack()
  expect_true(result$player_score >= 2 && result$player_score <= 21)
  expect_true(result$dealer_score >= 2 && result$dealer_score <= 21)
})

test_that("play_blackjack result is valid", {
  result <- play_blackjack()
  expect_true(result$result %in% c("Player busts", "Dealer busts", "Player wins", "Dealer wins", "Push"))
})

