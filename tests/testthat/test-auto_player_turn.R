test_that("auto_player_turn works as expected", {
  deck <- c("2♠", "3♦", "4♣")
  player_hand <- c("2♣")
  threshold <- 10

  result <- auto_player_turn(player_hand, deck, threshold)

  expect_gte(result$total, threshold)
  expect_gt(length(result$hand), 1)
  expect_lt(length(result$deck), length(deck))
})
