test_that("play_blackjack run and return result without crashing", {
  fake_input <- local({
    calls <- 0L
    ans   <- c("s", "s", "s", "s")
    function(prompt) {
      calls <<- calls + 1L
      ans[calls]
    }
  })
  out <- play_blackjack_multi(input_fn = fake_input)
  expect_s3_class(out, "data.frame")
  expect_named(
    out,
    c("player", "hand", "score", "result")
  )
})
