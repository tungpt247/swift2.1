/*
  Method Overloading in Swift

  There''re many ways to override or overloading methods in Swift.
  One of possible overloading mechanisms is by type:
*/
class Example {

  func method(a: String) -> String {
    return "A"
  }

  func method(b: Int) -> Int {
    return 1
  }

}

/*
You can call the same method name with different types and during compilr time the correct code path will be determined and optimized.
*/

print(Example().method(1))
print(Example().method("XYZ"))


/*
  Generic method overloading by Protocol
  

  You want to call 'store' on all objects, without having to dynamically check the type  to see if the object is Storeable or Interim. You can simply do that by adding the protocol
*/
protocol Storeable {}
protocol Interim {}

class DBStore<T> {

  func store<T: Storeable>(a: T) {
    // Do more with T
  }

  func store<T: Interim>(a: T) {
    // Do more with T
  }
}

/*
  And now you can call 'store' the same method in your code and the correct code path will be determined at compile time without any overhead

*/
