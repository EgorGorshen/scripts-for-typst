#import "matrix.typ": *
#import "truth-table.typ": *
#import "utils.typ": *
#import "gause-algo.typ": *

/*
  Утилита для оформления вопросов запросов etc...

  https://github.com/jomaway/typst-gentle-clues/tree/main
*/
#import "@preview/gentle-clues:0.9.0": *

#import "@preview/cetz:0.1.2": *

#let A = (
  (9, 9, -18, 27, 9), 
  (-3, 1, 2, -1, 17),
  (8, 0, -8, 8, -32),
  (3, -6, 3, -9, -42)
)

#gaussian_method_print(A)

#matPrintAsCases(gaussian_method_result(A))