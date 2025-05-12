

deck <- expand.grid(
  rank = as.character(c(2:10, "J","Q","K","A")),
  suit = c("♠","♥","♦","♣"),
  stringsAsFactors = FALSE
)

card_number <- c("2" = 2, "3" = 3, "4" = 4, "5" = 5, "6" = 6, "7" = 7, "8" = 8, "9" = 9, "10" = 10, "J" = 10, "Q" = 10, "K" = 10, "A" = 11)

card_value <- function(cards) {
  ranks <- sub(".$", "", cards)
  vals <- unname(card_number[ranks])
  total <- sum(vals)
  number_of_aces  <- sum(ranks == "A")
  while (total > 21 && number_of_aces > 0) {
    total <- total - 10
    number_of_aces  <- number_of_aces - 1
  }
  return(total)
}

