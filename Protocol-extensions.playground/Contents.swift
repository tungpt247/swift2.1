//: Playground - noun: a place where people can play


protocol TwoDMovable {
  mutating func relativeMoveBy(x: Int, y: Int)
}

struct myPoint: TwoDMovable {
  var x: Int
  var y: Int

  mutating func relativeMoveBy(x: Int, y: Int) {
    self.x += x
    self.y += y
  }

}

extension TwoDMovable {
  mutating func moveToTheRight(rightMovement: Int) {
    relativeMoveBy(rightMovement, y: 0)
  }
}