//: Playground - noun: a place where people can play

import Foundation

class Song {
  private let lineStart = "This is "
  private let lineEnd = "."
  private var phrases = [
    "the house that Jack built",
    "the malt that lay in",
    "the rat that ate"
  ]

  init(repeatx: Bool) {
    if repeatx {
      self.phrases = self.phrases.map { phrase in
        return phrase + " " + phrase
      }
    }
  }

  func line(number: Int) -> String {
    let linePhrases = self.phrases[0...number-1].reverse()
    let line = linePhrases.joinWithSeparator(" ")
    return self.lineStart + line + lineEnd
  }

  func recite() -> String {
    var lines = [String]()
    for i in 1...self.phrases.count {
      lines.append(self.line(i))
    }
    return lines.joinWithSeparator("\n")
  }

}