test_that("dealer_turn_smart draws when dealer total is low", {
  deck <- c("3♣", "4♦", "5♠")
  dealer_hand <- c("2♠")
  player_hand <- c("9♠", "8♦")

  result <- dealer_turn_smart(dealer_hand, player_hand, deck)

  expect_gte(result$total, 17)
  expect_gt(length(result$hand), 1)
  expect_lt(length(result$deck), length(deck))
})
