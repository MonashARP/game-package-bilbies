test_that("simulation_blackjack runs and returns a table", {
  result <- simulation_blackjack()
  expect_s3_class(result, "table")
})
