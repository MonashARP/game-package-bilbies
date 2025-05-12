test_that("card_value correctly handles Aces", {
  expect_equal(card_value(c("A♠", "K♦")), 21)         # Ace + King = 21
  expect_equal(card_value(c("A♠", "9♥", "A♦")), 21)    # 2 Aces and 9
  expect_equal(card_value(c("A♠", "9♥", "5♦")), 15)    # Ace adjusted to 1
})
