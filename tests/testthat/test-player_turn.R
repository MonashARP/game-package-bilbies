test_that("player_turn draws once then busts", {
  deck <- rep("10♠", 208)
  starting_hand <- c("7♠","8♦")

  fake_input <- local({
    calls <- 0L
    ans   <- c("h","s")
    function(prompt) {
      calls <<- calls + 1L
      ans[calls]
    }
  })

  out <- player_turn(starting_hand, deck, input_fn = fake_input)
  # after one hit of 10, total → 25 (bust)
  expect_gt(out$total, 21)
  expect_length(out$hand, 3)
})

test_that("player_turn draws twice then stands on 19", {
  deck <- rep("2♠", 208)
  starting_hand <- c("7♠","8♦")

  fake_input <- local({
    calls <- 0L
    ans   <- c("h","h","s")
    function(prompt) {
      calls <<- calls + 1L
      ans[calls]
    }
  })

  out <- player_turn(starting_hand, deck, input_fn = fake_input)
  # After two hits of 2, total → 15 + 2 + 2 = 19
  expect_equal(out$total, 19L)
  # cards = 2 original + 2 drawn
  expect_length(out$hand, 4L)
})
