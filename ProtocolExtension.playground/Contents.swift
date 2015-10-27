protocol Bird {
  var name: String { get }
  var canFly: Bool { get }
}

protocol Flyable {
  var airspeedVelocity: Double { get }
}

struct FlappyBird: Bird, Flyable {
  let name: String
  let flappyAmplitude: Double
  let flappyFrequency: Double

  var airspeedVelocity: Double {
    return 3 * flappyAmplitude * flappyFrequency
  }
}

struct Penguin: Bird {
  let name: String
  let canFly: Bool
}

struct SwiftBird: Bird, Flyable {
  var name: String { return "Swift \(version)" }
  let version: Double

  var airspeedVelocity: Double { return 2000.0 }
}

// extending protocols with default implementations

extension Bird where Self: Flyable {

  // set default for canFly attribute
  var canFly: Bool { return true }
}

enum UnladenSwallow: Bird, Flyable {
  case African
  case European
  case Unknow

  var name: String {
    switch self {
    case .African:
      return "African"
    case .European:
      return "European"
    case .Unknow:
      return "Unknow"
    }
  }

  var airspeedVelocity: Double {
    switch self {
    case .African:
      return 10.0
    case .European:
      return 9.0
    case .Unknow:
      return 1.0
    }
  }
}

// Extending Protocols

extension CollectionType {

  // return elements in collection and return array of unskipped
  func ski(skip: Int) -> [Generator.Element] {
    guard skip != 0 else { return [] }

    var index = self.startIndex
    var result: [Generator.Element] = []
    var i = 0

    repeat {
      if i % skip == 0 {
        result.append(self[index])
      }
    index = index.successor()
    i++
    } while (index != self.endIndex)

    return result
  }

}