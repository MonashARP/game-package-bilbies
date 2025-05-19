test_that("simulation_blackjack run with threshold of 16 and returns a table", {
  result <- simulation_blackjack(16)
  expect_s3_class(result, "table")
})
