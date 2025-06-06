test_that("card_symbol.card() returns the underlying `suit_symbol` field for each card", {
  set.seed(435)
  deck <- create_shuffled_deck(noOfDecks = 1)
  expect_s3_class(deck, "card")

  actual_symbols <- vctrs::field(deck, "suit_symbol")
  expect_identical(card_symbol(deck), actual_symbols)
})

test_that("card_symbol.character() returns the character vector unchanged", {
  chars <- c("♠", "♥", "♦", "♣")
  result <- card_symbol(chars)
  expect_identical(result, chars)
})

test_that("card_symbol.default() errors on unsupported types", {
  expect_error(
    card_symbol(1:10),
    "`card_symbol\\(\\)` only works on objects of class 'card' or plain character vectors\\."
  )
  expect_error(
    card_symbol(factor(c("♠", "♥"))),
    "`card_symbol\\(\\)` only works on objects of class 'card' or plain character vectors\\."
  )
})

test_that("card_symbol returns '♥' for the fourth card in a fixed shuffle", {
  set.seed(435)
  deck <- create_shuffled_deck(noOfDecks = 1)
  expect_identical(card_symbol(deck[4]), "♥")
})
