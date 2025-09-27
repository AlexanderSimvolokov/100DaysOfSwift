import UIKit

var greeting = "Hello, playground"

enum SquareRootError: Error {
    case decimalNamber
}

func squareRoot(_ number: Int) throws -> Int {
    
    var squareRoot: Double
    
    squareRoot = sqrt(Double(number))
    
    
    if squareRoot == Double(Int(squareRoot)) {
        return Int(squareRoot)
    } else {
        throw SquareRootError.decimalNamber
    }
    
}

do {
    let result = try squareRoot(9)
    print("SQRT =\(result)")
} catch SquareRootError.decimalNamber {
    print("Число не имеет целого квадратного корня")
} catch {
    print("Неопознанная ошибка \(error)")
}
