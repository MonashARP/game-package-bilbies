test_that("create_shuffled_deck returns correct number of cards", {
  deck_1 <- create_shuffled_deck(1)
  deck_4 <- create_shuffled_deck(4)
  deck_6 <- create_shuffled_deck(6)

  expect_length(deck_1, 52)
  expect_length(deck_4, 208)
  expect_length(deck_6, 312)
})

test_that("create_shuffled_deck only contains valid cards", {
  suits <- c("♠", "♥", "♦", "♣")
  ranks <- c(2:10, "J", "Q", "K", "A")
  valid_cards <- paste0(rep(ranks, times = length(suits)),
                        rep(suits, each  = length(ranks)))

  deck <- create_shuffled_deck(4)
  expect_true(all(deck %in% valid_cards))
})

test_that("create_shuffled_deck randomizes the order", {
  set.seed(1)
  deck1 <- create_shuffled_deck(1)

  set.seed(1)
  deck2 <- create_shuffled_deck(1)

  expect_equal(deck1, deck2)  # deterministic with same seed

  deck3 <- create_shuffled_deck(1)
  expect_false(identical(deck1, deck3))  # different seed = different shuffle
})

