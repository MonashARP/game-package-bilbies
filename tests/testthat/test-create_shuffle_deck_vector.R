test_that("create_shuffled_deck returns a card record of correct class", {
  set.seed(123)
  single_deck <- create_shuffled_deck(noOfDecks = 1)
  expect_s3_class(single_deck, "card")
  expect_length(single_deck, 52L)
})

test_that("`name` field contains valid card codes", {
  deck <- create_shuffled_deck(noOfDecks = 1)
  names_vec <- vctrs::field(deck, "name")
  valid_pattern <- "^(?:[2-9]|10|J|Q|K|A)[\u2660\u2665\u2666\u2663]$"
  all_match <- all(grepl(valid_pattern, names_vec, perl = TRUE))
  expect_true(all_match,info = "Each `name` should match <rank><suit_symbol>, e.g. 'A♠', '10♦', etc.")
  })

test_that("`rank` field contains only the expected English rank words", {
  set.seed(99)
  deck <- create_shuffled_deck(noOfDecks = 1)
  rank_vec <- vctrs::field(deck, "rank")

  used_ranks <- c(
    "Two", "Three", "Four", "Five", "Six",
    "Seven", "Eight", "Nine", "Ten",
    "Jack", "Queen", "King", "Ace")
  expect_setequal(unique(rank_vec), used_ranks)
})

test_that("`suit_symbol` field contains only the four valid suit symbols", {
  deck <- create_shuffled_deck(noOfDecks = 1)
  sym_vec <- vctrs::field(deck, "suit_symbol")
  allowed_symbols <- c("\u2660", "\u2665", "\u2666", "\u2663")  # ♠, ♥, ♦, ♣
  expect_setequal(unique(sym_vec), allowed_symbols)
})

test_that("`suit` field contains only the four valid suit names", {
  deck <- create_shuffled_deck(noOfDecks = 1)
  suit_vec <- vctrs::field(deck, "suit")
  allowed_suits <- c("Spade", "Heart", "Diamond", "Club")
  expect_setequal(unique(suit_vec), allowed_suits)
})

test_that("`is_face` is TRUE exactly for Jack, Queen, King ranks", {
  deck <- create_shuffled_deck(noOfDecks = 1)
  rank_vec   <- vctrs::field(deck, "rank")
  face_flags <- vctrs::field(deck, "is_face")
  expected_flags <- rank_vec %in% c("Jack", "Queen", "King")
  expect_identical(face_flags, expected_flags)
})

test_that("create_shuffled_deck produces a record with exactly five fields", {
  deck <- create_shuffled_deck(noOfDecks = 1)
  fields <- names(unclass(deck))
  expect_length(fields, 5L)
  expect_identical(
    sort(fields),
    sort(c("name", "rank", "suit_symbol", "suit", "is_face"))
  )
})








