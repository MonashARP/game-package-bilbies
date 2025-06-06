test_that("card_rank.card() returns the underlying `rank` field for each card", {
  set.seed(2025)
  deck <- create_shuffled_deck(noOfDecks = 1)
  expect_s3_class(deck, "card")
  actual_ranks <- vctrs::field(deck, "rank")
  expect_identical(card_rank(deck), actual_ranks)
})

test_that("card_rank.character() returns the character vector unchanged", {
  chars <- c("Two", "Jack", "Ten", "Queen")
  result <- card_rank(chars)
  expect_identical(result, chars)
})

test_that("card_rank.default() errors on unsupported types", {
  expect_error(
    card_rank(1:10),
    "`card_rank\\(\\)` only works on objects of class 'card' or plain character vectors\\."
  )
  expect_error(
    card_rank(factor(c("Ace", "King"))),
    "`card_rank\\(\\)` only works on objects of class 'card' or plain character vectors\\."
  )
})

test_that("card_rank returns 'Jack' for the third card in a fixed shuffle", {
  set.seed(435)
  deck <- create_shuffled_deck(noOfDecks = 1)
  expect_identical(card_rank(deck[3]), "Jack")
})

