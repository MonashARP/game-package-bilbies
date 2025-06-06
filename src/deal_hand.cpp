#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
List deal_hand_cpp(RObject deck, int n) {   // make sure it accept deck
  Function br("[");                    // tell R we want to use the bracket operator
  IntegerVector idx = seq_len(n);      // convert integer n to an index vector

  return List::create(
    _["hand"] = br(deck, idx),         // this part is equivalent to deck[1:n]
    _["deck"] = br(deck, -idx)         // this part is equivalent to deck[-(1:n)]
  );
}



