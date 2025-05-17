test_that("create_shuffled_deck returns correct number of cards", {
  deck4 <- create_shuffled_deck(4)
  expect_length(deck4, 208)

  deck6 <- create_shuffled_deck(6)
  expect_length(deck6, 312)

  deck1 <- create_shuffled_deck(1)
  expect_length(deck1, 52)
})

test_that("create_shuffled_deck only includes valid cards", {
  valid_ranks <- c(2:10, "J", "Q", "K", "A")
  valid_suits <- c("♠", "♥", "♦", "♣")
  valid_cards <- paste0(
    rep(valid_ranks, times = length(valid_suits)),
    rep(valid_suits, each = length(valid_ranks))
  )

  deck <- create_shuffled_deck(4)
  expect_true(all(deck %in% valid_cards))
})
test_that("card_value correctly sums basic hands", {
  expect_equal(card_value(c("2♠", "3♣")), 5)
  expect_equal(card_value(c("10♠", "K♣")), 20)
  expect_equal(card_value(c("7♠", "5♥", "9♦")), 21)
})

test_that("card_value handles Aces correctly", {
  expect_equal(card_value(c("A♠", "9♣")), 20)
  expect_equal(card_value(c("A♠", "9♣", "2♦")), 12)
  expect_equal(card_value(c("A♠", "A♣")), 12)
  expect_equal(card_value(c("A♠", "A♣", "9♠")), 21)
  expect_equal(card_value(c("A♠", "A♣", "9♠", "K♣")), 21)
  expect_equal(card_value(c("A♠", "A♣", "9♠", "K♣", "2♦")), 23)
})
