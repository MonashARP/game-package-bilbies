test_that("simulation_blackjack returns expected structure", {
  set.seed(123)  # Make the test reproducible
  result <- simulation_blackjack(n_sim = 10, threshold = 16)

  # Check it's a table
  expect_s3_class(result, "table")

  # Check names are among valid outcomes
  expect_true(all(names(result) %in% c("Win", "Lose", "Push")))

  # Check the total number of simulations equals 10
  expect_equal(sum(result), 10)
})

test_that("simulation_blackjack works at edge thresholds", {
  # Edge cases
  res_low  <- simulation_blackjack(n_sim = 5, threshold = 12)
  res_high <- simulation_blackjack(n_sim = 5, threshold = 21)

  expect_equal(sum(res_low), 5)
  expect_equal(sum(res_high), 5)
})

test_that("simulation_blackjack throws error for invalid thresholds", {
  expect_error(simulation_blackjack(threshold = 11), "must be a single number between 12 and 21")
  expect_error(simulation_blackjack(threshold = 22), "must be a single number between 12 and 21")
  expect_error(simulation_blackjack(threshold = "sixteen"), "must be a single number between 12 and 21")
  expect_error(simulation_blackjack(threshold = c(16, 17)), "must be a single number between 12 and 21")
})
