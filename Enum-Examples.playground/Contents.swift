import CoreGraphics
import SpriteKit

protocol CustomStringConvertible {
  var description: String { get }
}

enum Trade: CustomStringConvertible {
  case Buy, Sell

  var description: String {
    switch self {
    case .Buy:
      return "Buy"
    case .Sell:
      return "Sell"
    }
  }
}

let action = Trade.Buy
print(action.description)

protocol AccountCompatible {
  var remainingFunds: Int {get}
  mutating func addFunds(amount: Int) throws
  mutating func removeFunds(amount: Int) throws
}

enum Account {
  case Empty
  case Funds(remaining: Int)

  enum Error: ErrorType {
    case Overdraft(amout: Int)
  }

  var remainingFunds: Int {
    switch self {
    case .Empty:
      return 0
    case .Funds(let remaining):
      return remaining
    }
  }
}

extension Account: AccountCompatible {
  mutating func addFunds(amount: Int) throws {
    var newAmount = amount

    if case let .Funds(remaining) = self {
      newAmount += remaining
    }

    if newAmount < 0 {
      throw Error.Overdraft(amout: -newAmount)
    } else if newAmount == 0 {
      self = .Empty
    } else {
      self = .Funds(remaining: newAmount)
    }
  }

  mutating func removeFunds(amount: Int) throws {
    try self.addFunds(amount * -1)
  }
}

var account = Account.Funds(remaining: 20)
print("add", try? account.addFunds(10))
print("remove 1", try? account.removeFunds(15))
print("remoe 2", try? account.removeFunds(55))


// Extension

enum Entities {
  case Solider(x: Int, y: Int)
  case Tank(x: Int, y: Int)
  case Player(x: Int, y: Int)
}

extension Entities {
  func move(dist: CGVector) {}
  func attack() {}
}


extension Entities: CustomStringConvertible {
  var description: String {
    switch self {
    case .Solider(let x, let y): return "Solider \(x) \(y)"
    case .Tank(let x, let y): return "Tank \(x)\(y)"
    case .Player(let x, let y): return "Player \(x)\(y)"
    }
  }
}


// Generic Enums

let aValue = Optional<Int>.Some(5)
let noValue = Optional<Int>.None
if noValue == Optional.None { print("No value") }

// Recursive / Indirect Types
