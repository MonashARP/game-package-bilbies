card_value <- function(x) {
  UseMethod("card_value")
}

card_value.character <- function(x) {
  values <- c(
    `2`  = 2,  `3`  = 3,  `4`  = 4,  `5`  = 5,  `6`  = 6,
    `7`  = 7,  `8`  = 8,  `9`  = 9, `10` = 10,
    J    = 10,  Q    = 10,  K    = 10,  A    = 11
  )
  ranks <- sub(".$", "", x)
  vals  <- unname(values[ranks])
  total <- sum(vals, na.rm = TRUE)
  n_aces <- sum(ranks == "A")
  while (total > 21L && n_aces > 0L) {
    total  <- total - 10L
    n_aces <- n_aces - 1L
  }
  total
}

card_value.card <- function(x) {
  values <- c(
    `2`  = 2,  `3`  = 3,  `4`  = 4,  `5`  = 5,  `6`  = 6,
    `7`  = 7,  `8`  = 8,  `9`  = 9, `10` = 10,
    J    = 10,  Q    = 10,  K    = 10,  A    = 11
  )
  card_strings <- field(x, "name")
  ranks        <- sub(".$", "", card_strings)
  vals         <- unname(values[ranks])
  total        <- sum(vals, na.rm = TRUE)
  n_aces       <- sum(ranks == "A")
  while (total > 21L && n_aces > 0L) {
    total  <- total - 10L
    n_aces <- n_aces - 1L
  }
  total
}


card_value.default <- function(x) {
  stop("`card_value() was not built to handle this class yet '", class(x)[1], "'.")
}
