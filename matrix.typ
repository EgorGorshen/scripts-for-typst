
#import "@preview/suiji:0.3.0": *

#set text(size: 18pt)

#let M = matrix => math.mat(..matrix)
#let matT = matrix => {
  let ret = ()
  for i in range(matrix.at(0).len()) {
    let r = ()
    for j in range(matrix.len()) {
      r.push(matrix.at(j).at(i))
    }
    ret.push(r)
  }
  ret
}

#let rmatrix(n, m, mn:-20, mx: 20, rn:122, tp: "int", fround: 2) = {
  let returner = ()
  let rnfn = if tp == "int" {integers} else if tp == "float" {uniform}
  let rng = gen-rng(rn)
  let r = ()
  for i in range(n) {
    (rng, r) = rnfn(rng, low: mn, high: mx, size: m)
    r = r.map((x) => calc.round(x, digits: fround))
    returner.push(r)    
  }
  returner
}

#let grn = gen-rng(122)

#let rmatI = (n, m, rn) => rmatrix(n, m, rn: rn)
#let rmatF = (n, m, rn, fr: 2) => rmatrix(n, m, tp: "float", fround: fr)

#let matMultAlpha = (A, alpha) => A.map((x) => x.map((n) => n * alpha))

#let matSum(A, B) = {
  if A.len() != B.len() and A.at(0).len() != B.at(0).len() {
    return "Матрицы не совпадают по размерам"
  }
  let ret = ()

  for i in range(A.len()) {
    let r = ()
    for j in range(A.at(0).len()) {
        r.push(A.at(i).at(j) + B.at(i).at(j))
    }
    ret.push(r)
  }
  ret
}

#let matMinus = (A, B) => matSum(A, matMultAlpha(B, -1))

#let matMult(A, B) = {
  if A.at(0).len() != B.len() {
    return "Ошибка: не соответсвие размеров матриц"    
  }
  let BT = matT(B)
  let ret = ()

  for i in range(A.len()) {
    let r = ()
    for j in range(B.at(0).len()) {
      let lineA = A.at(i)
      let columB = BT.at(j)
      let sm = range(lineA.len()).map(index => lineA.at(index) * columB.at(index)).sum()
      r.push(sm)
    }
    ret.push(r)
  }
  ret
}


#let matDet(A) = {
  let ret = 0
  if A.len() != A.at(0).len() {
    return "Ошибка: невозможно вычислить det `col.len() != line.len()`"
  }
  if A.len() == 1 {
    return A.at(0).at(0)
  }
  for i in range(A.len()) {
    let subMatrix = ()
    for j in range(1, A.len()) {
      let row = ()
      for k in range(A.len()) {
        if k != i {
          row.push(A.at(j).at(k))
        }
      }
      subMatrix.push(row)
    }
    ret += calc.pow(-1, i) * A.at(0).at(i) * matDet(subMatrix)
  }
  return ret
}
