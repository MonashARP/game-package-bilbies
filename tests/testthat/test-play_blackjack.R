test_that("play_blackjack run and return result without crashing", {
  fake_input <- local({
    calls <- 0L
    ans   <- c("h","h","s")
    function(prompt) {
      calls <<- calls + 1L
      ans[calls]
    }
  })
  out <- play_blackjack(input_fn = fake_input)
  expect_type(out, "list")
  expect_named(
    out,
    c("player_hand", "dealer_hand", "player_score", "dealer_score", "result")
  )
})

