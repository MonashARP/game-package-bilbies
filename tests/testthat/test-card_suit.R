test_that("card_suit.card() returns the underlying `suit` field for each card", {
  set.seed(435)
  deck <- create_shuffled_deck(noOfDecks = 1)
  expect_s3_class(deck, "card")

  actual_suits <- vctrs::field(deck, "suit")
  expect_identical(card_suit(deck), actual_suits)
})

test_that("card_suit.character() returns the character vector unchanged", {
  chars <- c("Spade", "Heart", "Diamond", "Club")
  result <- card_suit(chars)
  expect_identical(result, chars)
})

test_that("card_suit.default() errors on unsupported types", {
  expect_error(
    card_suit(1:10),
    "`card_suit\\(\\)` only works on objects of class 'card' or plain character vectors\\."
  )
  expect_error(
    card_suit(factor(c("Spade", "Heart"))),
    "`card_suit\\(\\)` only works on objects of class 'card' or plain character vectors\\."
  )
})

test_that("card_suit returns 'Heart' for the fourth card in a fixed shuffle", {
  set.seed(435)
  deck <- create_shuffled_deck(noOfDecks = 1)
  expect_identical(card_suit(deck[4]), "Heart")
})

