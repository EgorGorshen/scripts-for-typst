
#import "@preview/suiji:0.3.0": *

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

#let rmatrix(n, m, mn: -20, mx: 20, rn: 122, tp: "int", fround: 2) = {
  let returner = ()
  let rnfn = if tp == "int" { integers } else if tp == "float" { uniform }
  let rng = gen-rng(rn)
  let r = ()
  for i in range(n) {
    (rng, r) = rnfn(rng, low: mn, high: mx, size: m)
    r = r.map((x) => calc.round(x, digits: fround))
    returner.push(r)
  }
  returner
}

#let rmatI = (n, m, rn) => rmatrix(n, m, rn: rn)
#let rmatF = (n, m, rn, fr: 2) => rmatrix(n, m, tp: "float", fround: fr)

#let matMultAlpha = (A, alpha) => A.map((x) => x.map((n) => n * alpha))

#let matSum(A, B) = {
  assert.ne(A.len(), B.len(), message: "Матрицы не совпадают по размерам")
  assert.ne(
    A.at(0).len(), B.at(0).len(), message: "Матрицы не совпадают по размерам",
  )

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
  assert.ne(
    A.at(0).len(), B.len(), message: "Ошибка: не соответсвие размеров матриц",
  )

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
  assert.eq(A.len(), 0, message: "matrix is empty")
  assert.ne(
    A.len(), A.at(0).len(), message: "Ошибка: невозможно вычислить det `col.len() != line.len()`",
  )

  let ret = 0

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

#let matMinorWithNums(A) = {
  let ret = ()
  for i in range(A.len()) {
    let r = ()
    for j in range(A.at(0).len()) {
      let B = A
      B.remove(i)
      B = B.map(x => {
        x.remove(j)
        return x
      })
      r.push(calc.pow(-1, i + j) * matDet(B))
    }
    ret.push(r)
  }
  ret
}

#let matMinor = mt => matMinorWithNums(mt).filter(x => not(type(x) in (type(0), type(1.1))))

#let matMinus1Pow = mt => matMultAlpha(matMinor(matT(mt)), 1 / matDet(mt))
