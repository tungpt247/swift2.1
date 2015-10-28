import Foundation

let bool1 = 1
let bool2 = 0

switch (bool1, bool2) {
case (0, 0): print("0 0")
case (0, 1): print("0 1")
case (1, 0): print("1 0")
case (1, 1): print("1 1")
default: ()
}

// Trading engine

enum TradeType {
  case SingleGuy
  case Company
}

enum Trades {
  case Buy(stock: String, amount: Int, stockFloat: Float, type: TradeType)
  case Sell(stock: String, amount: String, stockPrice: Float, type: TradeType)
}

func processFast(stock: String, _ amount: Int, _ fee: Float) {
  print("Fast")
}

func processSlow(stock: String, _ amount: Int, _ fee: Float) {
  print("Slow")
}

let aTrade = Trades.Buy(stock: "A", amount: 10, stockFloat: 10, type: TradeType.SingleGuy)

switch aTrade {
case .Buy(let stock, let amount, _, TradeType.SingleGuy):
  processSlow(stock, amount, 5.0)
case .Sell(let stock, let amount, _, TradeType.SingleGuy):
  processSlow(stock, -1 * Int(amount)! , 5.0)
case .Buy(let stock, let amount, _, TradeType.Company):
  processFast(stock, amount, 2.0)
case .Sell(let stock, let amount, _, TradeType.Company):
  processFast(stock, -1 * Int(amount)!, 2.0)
}

/*:
# There are 7 different patterns
All of those patterns can not only be used with the switch keyword, but also with the if, guard, and for keywords. For details on this, see below.
*/


/*: 
# Wildcard pattern
The wildcard pattern ignores the value to be matched againt. In this case any value is possible.
*/

let p: String? = nil
switch p {
case _?: print("Has string")
case nil: print("No string")
}

/*:
As in tradition example. It also allows you to omit the data you don't need form matching enums or tuples
*/
switch ( 15, "xxx", 3.14) {
case (_, _, let pi): print(pi)
}

/*:
# Indentifier Pattern
Match a concrete value.
*/
switch 5 {
case 5: print("5")
}

/*:
# Value-binding Pattern
This is thrr very same as binding values to variables via let or var. Only in a switch statement.
*/
switch (4, 5) {
case let(x, y): print("\(x) \(y)")
}

/*:
# Tuple Pattern
Here, we're combining 3 values into a tuple
This pattern achieves 3 things:
1. It extracts the age
2. It makes sure there is a job, even though we don't need it
3. It makes sure that payload is of kind NSDictionary althought we do not need the actual value either
*/
let age = 12
let job: String? = "Meo Meo"
let payload: AnyObject = NSDictionary()

switch (age, job, payload) {
case (let age, _?, _ as NSDictionary):
  print(age)
default: ()
}

/*:
# Enumeration Case Pattern
Pattern matching really great with Swift's enums. That's because enum cases are like sealed, immutable, destructable structs.
Much like with tuples, you can unwrap the contents of an individual case right in the match and only extract the information you need.
*/

enum Entities {
  case Solider(x: Int, y: Int)
  case Tank(x: Int, y: Int)
}
/*:
Now you need to implement the drawing loop. Here, we need only x, y position
*/
let entities = Entities.Tank(x: 10, y: 10)
switch entities {
case .Tank(let x, let y): break
case .Solider(let x, let y): break
}


/*:
# type-Casting patterns
This pattern casts or matches types. It has two different keyworkds:
1. is type: matches the runtime type
2. as type:
*/

let a: Any = 5
switch a {
  //case is Int: print(a + 1) // this fails because a is still anyobject
// error: binary operator '+' cannot be applied to operands of type 'Any' and 'Int'
case let n as Int: print( n + 1)
default: ()
}

/*:
# Expression Pattern
The expression pattern is very powerful. It matches the switch value against an expression implementing the ~= operator. There're default implementations for this operator. For example for ranges
*/

switch 5 {
case 0...10: print("In range 0-10")
default: ()
}

/*
However, the much more interesting possibility is overloading the operator yourself in order to add matchability to your custom types.
*/

struct Solider {
  let id: Int
}

func ~=(pattern: Int, value: Solider) -> Bool {
  return pattern == value.id
}