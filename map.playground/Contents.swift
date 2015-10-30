import Foundation

func incrementArray(xs: [Int]) -> [Int] {
  var result: [Int] = []
  for x in xs {
    result.append(x + 1)
  }
  return result
}

func doubleArray1(xs: [Int]) -> [Int] {
  var result: [Int] = []
  for x in xs {
    result.append(x * 2)
  }
  return result
}

typealias F = Int -> Int

func computeInArray(xs: [Int], f: F) -> [Int] {
  var result: [Int] = []
  for x in xs {
    result.append(f(x))
  }
  return result
}

func doubleArray2(xs: [Int]) -> [Int] {
  return computeInArray(xs, f: { (x) -> Int in
    x * 2
  })
}

let arr = [1, 2, 3]
print(doubleArray1(arr))

/*:
Generic
*/

func genericComputeArray<U>(xs: [Int],f: Int -> U) -> [U] {
  var result: [U] = []
  for x in xs {
    result.append(f(x))
  }
  return result
}

func map<T, U>(xs: [T], f: T-> U) -> [U] {
  var result: [U] = []
  for x in xs {
    result.append(f(x))
  }
  return result
}