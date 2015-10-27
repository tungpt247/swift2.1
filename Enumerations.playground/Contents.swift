//: Playground - noun: a place where people can play

enum Animals {
  case Dog, Cat, Dragon
}

let a = Animals.Dog

switch a {
case .Dog: break
case .Cat: break
case .Dragon: break
}

// Associated values

enum Barcode {
  case UPCA(String)
  case QRCode(String)
}

// Declares

var productQRCode = Barcode.QRCode("#ASD123")

switch productQRCode {
case .UPCA(let name): break
case .QRCode(let name): break
}

// Raw values
// case with default value

enum ASCIICharacter: Character {
  case Tab = "\t"
  case LineFeed = "\n"
  case CarrieageReturn = "\r"
}


print(ASCIICharacter.Tab.rawValue)

enum Planet: Int {
  case Mercury = 1, Venus, Earth, Mars, Jupiter
}

print(Planet.Earth.rawValue)

// Init from rawValue
let possiblePlanet = Planet(rawValue: 6)
print(possiblePlanet)



// Recursive enumerations

class TreeX {
  let left: TreeX?
  let right: TreeX?
  let value: Int

  init(value: Int, left: TreeX?, right: TreeX?) {
    self.value = value
    self.left = left
    self.right = right
  }
}

//
// Insert an Int value to binary tree
//

protocol TreeProtocol {
  func insert(_: Int) -> TreeProtocol
  var depth: Int { get }
}

enum Tree: TreeProtocol {
  case Empty
  case Node(_ : Int, left: TreeProtocol, right: TreeProtocol)

  var depth: Int {
    switch self {
    case .Empty: break
    case let .Node(_, left, right):
      return 1 + max(left.depth, right.depth)
    }
    return 0
  }

  func insert(newValue: Int) -> TreeProtocol {
    switch self {
    case .Empty:
      return Tree.Node(newValue, left: Tree.Empty, right: Tree.Empty)
    case let .Node(value, left, right):
      if newValue > value {
        return Tree.Node(value, left: left, right: right.insert(newValue))
      } else {
        return Tree.Node(value, left: left.insert(newValue), right: right)
      }
    }
  }

}

// http://cutting.io/posts/the-power-of-swift-enums/