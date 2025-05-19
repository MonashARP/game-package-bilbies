test_that("dealer_turn works", {
  deck <- c("3♣", "4♦", "5♠")
  dealer_hand <- c("2♠")

  result <- dealer_turn(dealer_hand, deck)

  expect_gte(result$total, 17)
})
