let exampleFiles = ["A.swift", "B.swift", "C.swift", "D.swift"]

func getSwiftFiles(files: [String]) -> [String] {
  var result: [String] = []

  for file in files {
    if file.hasSuffix(".swift") {
      result.append(file)
    }
  }
  return result
}

getSwiftFiles(exampleFiles)

func filter<T>(xs: [T], check: T -> Bool) -> [T] {
  var result: [T] = []

  for x in xs {
    if check(x) {
      result.append(x)
    }
  }

  return result
}

func getSwiftFiles2(files: [String]) -> [String] {
  return filter(files, check: { (file) -> Bool in
    file.hasSuffix(".swift")
  })
}

// filter in standard library
exampleFiles.filter { (file) -> Bool in
  return file.hasSuffix(".swift")
}