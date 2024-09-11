#import "matrix.typ": *
#import "truth-table.typ": *
#import "utils.typ": *

// TODO: в truthTable добавить возможность настраивать true и false

/*
  Утилита для оформления вопросов запросов etc...
  
  https://github.com/jomaway/typst-gentle-clues/tree/main
  
  idea[`#idea[]`],
  abstract[`#abstract[]`],
  question[`#question[]`],
  info[`#info[]`],
  example[`#example[]`],
  experiment[`#experiment[]`],
  task[`#task[]`],
  error[`#error[]`],
  warning[`#warning[]`],
  success[`#success[]`],
  tip[`#tip[]`],
  conclusion[`#conclusion[]`],
  memo[`#memo[]`],
  quotation[`#quotation[]`],
  goal[`#goal[]`],
  notify[`#notify[]`],
  code[`#code[]`],
  danger[`#danger[]`]
  
*/
#import "@preview/gentle-clues:0.9.0": *

/*
#import "@preview/cetz:0.1.2": canvas, plot

#canvas(length: 1cm, {
  plot.plot(size: (8, 6),
    x-tick-step: none,
    x-ticks: ((-calc.pi, $-pi$), (0, $0$), (calc.pi, $pi$)),
    y-tick-step: 1,
    {
      plot.add(
        style: plot.palette.blue,
        domain: (-calc.pi, calc.pi), x => calc.sin(x * 1rad))
      plot.add(
        hypograph: true,
        style: plot.palette.blue,
        domain: (-calc.pi, calc.pi), x => calc.cos(x * 1rad))
      plot.add(
        hypograph: true,
        style: plot.palette.blue,
        domain: (-calc.pi, calc.pi), x => calc.cos((x + calc.pi) * 1rad))
    })
})
*/

#import "@preview/cetz:0.1.2": *