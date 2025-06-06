test_that("card_is_face look for field `is_face` created inside cards from create_shuffled_deck", {
  set.seed(123)
  deck <- create_shuffled_deck(noOfDecks = 1)
  expected_is_face <- card_is_face(deck)
  actual_is_face <- vctrs::field(deck, "is_face")
  expect_identical(actual_is_face, expected_is_face)
})

test_that("card_is_face.character returns the input vector unchanged", {
  chars <- c("2♠", "J♥", "10♣", "Q♦")
  result <- card_is_face(chars)
  expect_identical(result, chars)
})

test_that("card_is_face.default errors on unsupported types", {
  expect_error(card_is_face(1:5),
               "`card_is_face\\(\\)` only works on objects of class 'card' or plain character vectors\\.")
  expect_error(card_is_face(factor(c("A♠","J♥"))),
               "`card_is_face\\(\\)` only works on objects of class 'card' or plain character vectors\\.")
})

test_that("card_is_face work with a single face card", {
  set.seed(435)
  deck <- create_shuffled_deck(noOfDecks = 1)
  single_card <- deck[2]
  result <- card_is_face(single_card)
  expect_true(result)
})

