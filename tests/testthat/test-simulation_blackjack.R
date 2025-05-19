test_that("simulation_blackjack runs and returns a table", {
  with_mocked_bindings(
    result <- simulation_blackjack(n_sim = 3),
    readline = function(prompt) "13"
  )

  expect_s3_class(result, "table")
})
