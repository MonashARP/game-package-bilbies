test_that("auto_player_turn draws no cards when total ≥ threshold", {
  deck <- rep("2♠", 208)
  # Starting hand total = 16
  starting_hand <- c("8♠", "8♦")

  res <- auto_player_turn(starting_hand, deck, threshold = 16)

  # No draws should occur
  expect_equal(res$total, 16L)
  expect_equal(res$hand, starting_hand)
  expect_equal(res$deck, deck)
})

test_that("auto_player_turn draws until threshold reached", {
  deck <- rep("2♠", 208)
  # Starting hand total = 10
  starting_hand <- c("5♠", "5♦")

  str <- auto_player_turn(starting_hand, deck, threshold = 16)

  # Draws of 2 until total ≥ 16. That become 3 draws: 10 + 2 + 2 + 2 = 16
  expect_equal(str$total, 16L)
  expect_length(str$hand, 2 + 3)
  expect_equal(
    str$hand,
    c(starting_hand, rep("2♠", 3))
  )
  expect_length(str$deck, length(deck) - 3)
})
