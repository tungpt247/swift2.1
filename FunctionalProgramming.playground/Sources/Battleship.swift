/*:
# Battleship example

*/

import Foundation

typealias Position = CGPoint
typealias Distance = CGFloat

/*:
Detect my ship in the given range
*/
func inRange1(target: Position, range: Distance) -> Bool {
  return sqrt(target.x * target.x + target.y * target.y) <= range
}

/*:
My Ship has owner postion
*/
func inRange2(target: Position, ownPosition: Position, range: Distance) -> Bool {
  let dx = ownPosition.x - target.x
  let dy = ownPosition.y - target.y
  let targetDistance = sqrt(dx * dx + dy * dy)
  return targetDistance <= range
}

/*:
Avoid targeting ships if they are too close my Ship
*/
let miniumDistance: Distance = 2.0

func inRange3(target: Position, ownPositision: Position, range: Distance) -> Bool {
  let dx = ownPositision.x - target.x
  let dy = ownPositision.y - target.y
  let targetDistance = sqrt(dx * dx + dy * dy)

  return targetDistance < range && targetDistance > miniumDistance
}

/*:
Avoid targeting friends ship with my ship
*/
func inRange4(target: Position, ownPosition: Position, friendly: Position, range: Distance) -> Bool {
  let dx = ownPosition.x - target.x
  let dy = ownPosition.y - target.y
  let targetDistance = sqrt(dx * dx + dy * dy)
  let friendlyDx = friendly.x - target.x
  let friendlyDy = friendly.y - target.y
  let friendlyDistance = sqrt(friendlyDx * friendlyDx + friendlyDy * friendlyDy)

  return targetDistance <= range && targetDistance > miniumDistance && friendlyDistance > miniumDistance
}

/*: 
# Refactoring

Function that computes the distance between two points or functions that check when two points are 'close' or 'far away'
The original problem boiled down to defining a function that determinded when a point was in range or not. The type of such a function would be something like:
*/

func pointInRange(point: Position) -> Bool {
  return true
}

/*:
Region type will refer to functions transforming a Postion to a Bool
*/
typealias Region = Position -> Bool

/*
Instead of defining an object or struct to represent regions. We use function that determines if a given point is in the region or not.
*/
func circle(radius: Distance) -> Region {
  return { point in
    sqrt(point.x * point.x + point.y + point.y) <= radius
  }
}

/*:
Not all circles are centered around the origin. We could add more arguments to the circle function to account for this.
To compute a circle that;s centerd around a certain position, we just add another argument representing the circle's center and make sure to use the new argument to compute the new region.
*/
func circle2(radius: Distance, center: Position) -> Region {
  return { point in
    let shiftedPoint = Position(x: point.x - center.x, y: point.y - center.y)
    return sqrt(shiftedPoint.x * shiftedPoint.x + shiftedPoint.y * shiftedPoint.y) <= radius
  }
}

func shift(offset: Position, region: Region) -> Region {
  return { point in
    let shiftedPoint = Position(x: point.x - offset.x, y: point.y - offset.y)
    return region(shiftedPoint)
  }
}
