//: Playground - noun: a place where people can play

import Foundation

protocol Remixer {
  func result(list: Array<String>) -> Array<String>
}

class Repeater: Remixer {
  func result(list: Array<String>) -> Array<String> {
    return list.map { item -> String in
      return item + " " + item
    }
  }
}

class Reserver: Remixer {
  func result(list: Array<String>) -> Array<String> {
    return list.reverse()
  }
}

class Song {
  private let lineStart = "This is "
  private let lineEnd = "."
  private var phrases = [
    "the house that Jack built",
    "the malt that lay in",
    "the rat that ate"
  ]

  init(remixer: Remixer?) {
    guard let mixer = remixer else {
      print("Remixer is Optional")
      return
    }

    mixer.result(self.phrases)
  }
}

// http://sundeepgupta.ca/dependency-injection-example-in-swift/