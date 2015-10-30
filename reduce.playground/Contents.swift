func sum(xs: [Int]) -> Int {
  var result: Int = 0
  for x in xs {
    result += x
  }

  return result
}

sum([1, 2, 3])

func product(xs: [Int]) -> Int {
  var result: Int = 1
  for x in xs {
    result = x * result
  }

  return result
}

func concatenate(xs: [String]) -> String {
  var result: String = ""
  for x in xs {
    result += x
  }

  return result
}

// Generate

func reduce<A, R>(arr: [A], initialiValue: R, combine:(R, A) -> R) -> R {
  var result = initialiValue

  for i in arr {
    result = combine(result, i)
  }

  return result
}

func productUsingReduce(xs: [Int]) -> Int {
  return reduce(xs, initialiValue: 0, combine: +)
}
