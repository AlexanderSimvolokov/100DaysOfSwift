import UIKit

var greeting = "Hello, playground"

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

var newArr = luckyNumbers.filter { $0 % 2 != 0}

newArr.sort()

newArr.map { String($0) + " is a lucky number" }

print("\(newArr)")
