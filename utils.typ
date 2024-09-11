#import "@preview/ctheorems:1.1.2": *
#show: thmrules.with(qed-symbol: $square$)
#show "thm-qed-symbol": none
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
#let liner(title, body) = block(
  above: 2em, stroke: (left: 2pt),
  width: 100%, inset: 14pt
)[
  #set text(font: "Noto Sans")
  #place(
    top + left,
    dy: - 1em, // Account for inset of block
    dx: 6pt - 1em,
    [_*#title*_]
  )
  #body
]

#let proof(body) = liner("Доказательство", body)

