test_that("deal_hand returns correct number of cards", {
  hand <- deal_hand(2)
  expect_type(hand, "character")
  expect_length(hand, 2)
})

test_that("deal_hand draws unique cards", {
  hand <- deal_hand(10)
  expect_equal(length(unique(hand)), 10)
})

