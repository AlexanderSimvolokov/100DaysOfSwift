//
//  Order.swift
//  Projekt 10
//
//  Created by Alexander Simvolokov on 17.07.2026.
//

import SwiftUI

class Order {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
        
    var extraFrosting = false
    var addSprinkles = false
    
    var name = ""
    var streetAddrass = ""
    var city = ""
    var zip = ""
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddrass.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        return true
    }
}
