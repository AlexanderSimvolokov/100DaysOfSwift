import UIKit

var greeting = "Hello, playground"

var arrInt: [Int] = []

for i in 1...100 {
    arrInt.append(i)
}

for item in arrInt {
    if item.isMultiple(of: 3) && item.isMultiple(of: 5) {
        print("\(item) FizzBuzz")
    }
    else if item.isMultiple(of: 3) {
        print("\(item) Fizz")
    }
    else if item.isMultiple(of: 5) {
        print("\(item) Buzz")
    }
    else
    {
        print("\(item)")
    }
}
