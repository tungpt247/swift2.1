//: Playground - noun: a place where people can play

// Guard statement

struct Blog {
  let name: String?
  let url: String?
  let author: String?
}

func originalStyle(blog: Blog) {

  // old style
  if let name = blog.name {
    print("There is value in Optional\(name)")
  } else {
    print("There is no value Optional")
  }

  // new style
  guard let namex = blog.name else {
    print("There is no value")
    return
  }

  print("There is value here \(namex)")
}


let maybeNumbers: [Int?] = [3, 5, 7, nil, 8, 9]

for maybe in maybeNumbers {
  guard let value = maybe else {
    print("No value")
    break
  }

  print(value)
}

// http://www.codingexplorer.com/the-guard-statement-in-swift-2/