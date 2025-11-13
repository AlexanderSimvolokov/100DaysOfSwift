import UIKit

var greeting = "Hello, playground"

struct Car {
    private(set) var model: String
    let numberOfSeats: Int
    private(set) var currentGear: Int {
        didSet {
            print("Gear is change from \(oldValue) to \(currentGear)")
        }
    }
    
    init(model: String, currentGear: Int) {
        self.model = model
        self.currentGear = currentGear
        numberOfSeats = 4
    }
    
    mutating func shiftGear(to upGear: Bool) {
        if currentGear == 6 {
            print("Cannot shift gear - maximum gear is 6")
            return
        } else if currentGear == 0 {
            print("Cannot shift gear - minimum gear is 0")
            return
        }
        if upGear {
            currentGear += 1
        } else {
            currentGear -= 1
        }
    }
    
}

var MARK2 = Car(model: "Mark2", currentGear: 4)
MARK2.shiftGear(to: true)
MARK2.shiftGear(to: true)
MARK2.shiftGear(to: true)

