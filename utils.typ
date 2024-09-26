#import "@preview/ctheorems:1.1.2": *

// ------- ОФРОМЛЕНИЕ global --------
#show: thmrules.with(qed-symbol: $square$)
#show "thm-qed-symbol": none
#set heading(numbering: "1.1.")
#set math.equation(numbering: "[1.1]")

#show ref: it => {
  let eq = math.equation
  let el = it.element
  if el != none and el.func() == eq {
    numbering(el.numbering, ..counter(eq).at(el.location()))
  } else {
    it
  }
}

#let theorem = thmbox("theorem", "Теорема", fill: rgb("#FFB347"), stroke: (left: 0.25em))

#let corollary = thmplain(
  "заключение", "Заключение", base: "theorem", titlefmt: strong, fill: rgb("DDA0DD"), inset: 1em,
)

#let definition = thmbox("definition", "Определение", fill: rgb("#FFA07A"))

#let example = thmplain("example", "Пример").with(numbering: none)

#let liner(title, body) = block(above: 2em, stroke: (left: 2pt), width: 100%, inset: 14pt)[
  #set text(font: "Noto Sans")
  #place(
    top + left, dy: - 1em, // Account for inset of block
    dx: 6pt - 1em, [_*#title*_],
  )
  #body
]

#let proof(body) = liner("Доказательство", body)

