#let product(times, nums: (false, true)) = {
  if times == 0 {
    return ((),)
  }
  let ret = ()
  let prev = product(times - 1, nums: nums)
  for item in nums {
    for pr in prev {
      pr.insert(0, item)
      ret.push(pr)
    }
  }
  ret
}

#let truthTableArrayArray(func, args_num) = {
  let res = ()
  for args in product(args_num) {
    let r = func(..args)
    res.push(args + (r,))
  }
  res
}

#let func_body_predprosesor(fn_str) = {
  fn_str.replace("<=", "->").replace("==", "eq.triple").trim()
}

#let parse_func(fn) = {
  let args = fn.match(regex("^\(([^)]+)\)\s*=>\s*\{([^}]+)\}")).captures
  let args = (
    args: args.at(0).split(",").map(x => {eval(x.trim(), mode: "math")}),
    func_body: func_body_predprosesor(args.at(1))
  )
  args
}

#let truthTable(fn_str) = {
  let shfn = parse_func(fn_str)
  
  let fal = table.cell(
    fill: red.lighten(60%)
  )[false]

  let tru = table.cell(
    fill: green.lighten(60%)
  )[true]

  let name = i => table.cell(
    fill: gray.lighten(60%)
  )[$#i$]

  // ---- table predproses
  let tb = truthTableArrayArray(eval(fn_str, mode: "code"), shfn.args.len())
  tb = tb.flatten().map(x => if x == true {tru} else {fal})

  table(columns: shfn.args.len() + 1, ..(shfn.args.map(name), eval(shfn.func_body, mode: "math"), tb).flatten())
}