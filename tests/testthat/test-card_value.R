test_that("create_shuffled_deck returns 208 cards", {
  deck <- create_shuffled_deck()
  expect_length(deck, 208)
})

test_that("create_shuffled_deck only contains valid cards", {
  single_deck <- paste0(deck$rank, deck$suit)
  shoe <- create_shuffled_deck()
  expect_true(all(shoe %in% single_deck))
})

test_that("create_shuffled_deck contains repeated cards", {
  deck <- create_shuffled_deck()
  card_counts <- table(deck)
  expect_true(any(card_counts > 1))  # Since there are 4 decks, some cards must repeat
})
test_that("card_value sums numeric cards correctly", {
  expect_equal(card_value(c("2♠", "3♠", "4♠")), 9)
  expect_equal(card_value(c("10♠", "9♠")), 19)
})

test_that("card_value handles face cards correctly", {
  expect_equal(card_value(c("J♠", "Q♠")), 20)
  expect_equal(card_value(c("K♠", "10♠")), 20)
})

test_that("card_value treats Ace as 11 unless bust", {
  expect_equal(card_value(c("A♠", "8♠")), 19)
  expect_equal(card_value(c("A♠", "9♠")), 20)
  expect_equal(card_value(c("A♠", "9♠", "2♠")), 12)  # Ace should drop to 1
})

test_that("card_value handles multiple Aces correctly", {
  expect_equal(card_value(c("A♠", "A♣")), 12)
  expect_equal(card_value(c("A♠", "A♣", "9♠")), 21)
  expect_equal(card_value(c("A♠", "A♣", "9♠", "K♠")), 21)
  expect_equal(card_value(c("A♠", "A♣", "9♠", "K♠", "2♠")), 23)  # Bust
})
