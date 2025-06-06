test_that("dealer_turn draws until ≥17 when starting very low", {
  # Create a deck of 5 cards
  deck <- rep("5♠", 208)

  # Start the dealer at 11, and make the player score 16 and they stand
  dealer_hand <- c("7♠", "5♥")
  player_hand <- c("10♠", "6♠")

  result <- dealer_turn(dealer_hand, deck)

  # Dealer:  11 + 5 + 5 = 21
  expect_equal(result$total, 17L)
  expect_length(result$hand, 3L)
  expect_length(result$deck, 207L)
})

test_that("deal_hand.character returns correct hand and remaining deck", {
  chars <- c("A", "B", "C", "D", "E")
  res <- deal_hand(chars, n = 2)

  expect_type(res, "list")
  expect_named(res, c("hand", "deck"))

  expect_identical(res$hand, c("A", "B"))
  expect_identical(res$deck, c("C", "D", "E"))
})

test_that("deal_hand.card deals first n cards from card deck without reshuffle", {
  deck <- create_shuffled_deck(noOfDecks = 1)
  all_names <- vctrs::field(deck, "name")
  original_size <- vec_size(deck)
  res <- deal_hand(deck, n = 3)
  # Check return structure
  expect_type(res, "list")
  expect_named(res, c("hand", "deck"))
  # Both hand and deck should still be 'card' objects
  expect_s3_class(res$hand, "card")
  expect_s3_class(res$deck, "card")
  # Length checks
  expect_length(res$hand, 3)
  expect_length(res$deck, original_size - 3)
})

test_that("deal_hand.card reshuffles when deck is below 25% of a full deck", {
  set.seed(123)
  full_deck <- create_shuffled_deck(noOfDecks = 1)
  # A single deck has 52 cards; 25% threshold = 13. Use only 10 cards to force reshuffle.
  small_deck <- full_deck[1:10]
  # Confirm reshuffle message
  expect_output(
    {res2 <- deal_hand(small_deck, n = 2)},
    "creating new deck\\.\\.\\.")
  # After reshuffle, hand should be length 2 and deck length = (new deck size - 2)
  expect_s3_class(res2$hand, "card")
  expect_s3_class(res2$deck, "card")
  expect_length(res2$hand, 2L)
})


test_that("deal_hand.default errors on unsupported types", {
  expect_error(
    deal_hand(1:5),
    "deal_hand was not designed to work with this class yet")
  expect_error(
    deal_hand(factor(c("A", "K"))),
    "deal_hand was not designed to work with this class yet")
})
