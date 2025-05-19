test_that("player_turn stands immediately", {
  deck <- c("3♣", "4♦")
  player_hand <- c("5♠", "6♥")

  with_mocked_bindings(
    result <- player_turn(player_hand, deck),
    readline = function(prompt) "s"
  )

  expect_identical(result$hand, player_hand)
  expect_identical(result$deck, deck)
  expect_equal(result$total, card_value(player_hand))
})
