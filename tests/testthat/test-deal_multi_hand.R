test_that("deal_multi_hand works", {
  deck <- create_shuffled_deck()
  result <- deal_multi_hand(deck, n_players = 2)
  expect_true("hands" %in% names(result))
  expect_true("deck" %in% names(result))
})
