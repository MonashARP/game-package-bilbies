test_that("card_name.card() returns the underlying `name` field for each card", {
  set.seed(2025)
  deck <- create_shuffled_deck(noOfDecks = 1)
  expect_s3_class(deck, "card")
  actual_names <- vctrs::field(deck, "name")
  expect_identical(card_name(deck), actual_names)
})

test_that("card_name.character() returns the character vector unchanged", {
  chars <- c("2♠", "J♦", "10♣", "Q♥")
  result <- card_name(chars)
  expect_identical(result, chars)
})

test_that("card_name.default() errors on unsupported types", {
  expect_error(
    card_name(1:10),
    "`card_name\\(\\)` only works on objects of class 'card' or plain character vectors\\."
  )
  expect_error(
    card_name(factor(c("A♠", "K♦"))),
    "`card_name\\(\\)` only works on objects of class 'card' or plain character vectors\\."
  )
})

test_that("card_name works on a single 'card' element", {
  deck <- create_shuffled_deck(noOfDecks = 1)
  single_card <- deck[1]
  expect_s3_class(single_card, "card")
  expected_name <- vctrs::field(single_card, "name")
  result_name   <- card_name(single_card)
  expect_identical(result_name, expected_name)
})
