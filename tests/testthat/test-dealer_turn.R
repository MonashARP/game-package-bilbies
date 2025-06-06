test_that("dealer_turn works", {
  set.seed(123)
  deck <- create_shuffled_deck(4)
  dealer_hand <- deck[1]
  result <- dealer_turn(dealer_hand, deck)
  expect_gte(result$total, 18)
})

test_that("dealer_turn stops at 17 or higher", {
  set.seed(123)
  deck <- create_shuffled_deck(4)
  dealer_hand <- deck[1:2]
  result <- dealer_turn(dealer_hand, deck)
  expect_gte(result$total, 17)
})

test_that("dealer_turn dont draw at all when already has hand over 17", {
  set.seed(123)
  deck <- create_shuffled_deck(4)
  dealer_hand <- deck[2:3]
  result <- dealer_turn(dealer_hand, deck)
  expect_length(result$hand, 2)
})
