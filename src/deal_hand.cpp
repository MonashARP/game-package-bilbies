#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
List deal_hand_cpp(RObject deck, int n) {
  Function br("[");
  IntegerVector idx = seq_len(n);      // 1, 2, … n

  return List::create(
    _["hand"] = br(deck, idx),         // deck[1:n]
    _["deck"] = br(deck, -idx)         // deck[-(1:n)]
  );
}



