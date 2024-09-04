#import "@preview/ctheorems:1.1.2": *


// ------- ОФРОМЛЕНИЕ global --------
#set heading(numbering: "1.1.")
#set math.equation(numbering: "[1.1]", )

// ------- ref 
#show ref: it => {
  let eq = math.equation
  let el = it.element
  if el != none and el.func() == eq {
    numbering(
      el.numbering,
      ..counter(eq).at(el.location())
    )
  } else {
    it
  }
}

// ------- ОФОРМЛЕНИЕ БЛОКОВ -------

/* TODO:
- [x] теоремы
- [x] доказательства
- [x] определения
- [x] примеры
- [x] заключения
- [ ] задачи
- [ ] csv 
*/

// ------- теормы
#let theorem = thmbox("theorem", "Теорема", fill: rgb("#FFB347"), stroke: (left: 0.25em))

// ------- заключения
#let corollary = thmplain(
  "заключение",
  "Заключение",
  base: "theorem",
  titlefmt: strong, fill: rgb("DDA0DD"), 
 inset: 1em 
)

// ------- определения
#let definition = thmbox("definition", "Определение", fill: rgb("#FFA07A"))

// ------- примеры
#let example = thmplain("example", "Пример").with(numbering: none)

// ------- доказательства
#show: thmrules.with(qed-symbol: $square$)
