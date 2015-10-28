/*:
# Error handling

If you want to thw an error, the object thrown must conform to the ErrorType protocol
As you haved expected, NSError conforms to this protocol. Enums are used for classifying errors
*/

enum AwfulError: ErrorType {
  case Bad
  case Worse
  case Terrible
}
class Error {}

func doSomething() throws -> Error {
  // If something bad happendd, throw the error
  throw AwfulError.Bad

  // if something worse happends, throw the error
  throw AwfulError.Worse

  // If something terrible happends, throw the error
  throw AwfulError.Terrible

  // make can return here
  return Error()
}

/*:
In order to catch errors, a new do-catch statement is available

*/

do {
  let result = try doSomething()
}
catch AwfulError.Bad {}
catch AwfulError.Worse {}
catch AwfulError.Terrible {}
