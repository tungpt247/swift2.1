//: Playground - noun: a place where people can play

enum VendingMachineError: ErrorType {
  case InvalidParam
  case InsufficientFund(type: Int)
  case OutOfStack
}

