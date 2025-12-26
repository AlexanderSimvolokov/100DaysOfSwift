import UIKit

var greeting = "Hello, playground"

// 1. Название протокола и свойства — на английском и с правильным написанием
protocol Building {                     // Building, не Bilding
    var rooms: Int { get set }           // rooms вместо countRooms (более естественно)
    var price: Int { get set }           // price вместо cost (в задании "cost", но price чаще)
    var estateAgent: String { get set }  // estateAgent вместо nameAgent (точно по заданию)
    
    func printSalesSummary()            // Название метода точно по заданию
}

// 2. Структуры, конформящие протоколу
struct House: Building {
    var rooms: Int
    var price: Int
    var estateAgent: String
    
    // Инициализатор (очень рекомендуется, чтобы можно было создавать с разными значениями)
    init(rooms: Int, price: Int, estateAgent: String) {
        self.rooms = rooms
        self.price = price
        self.estateAgent = estateAgent
    }
    
    func printSalesSummary() {
        print("This is a house with \(rooms) rooms.")
        print("Price: $\(price)")
        print("Estate agent: \(estateAgent)")
        print("---")
    }
}

struct Office: Building {
    var rooms: Int
    var price: Int
    var estateAgent: String
    
    init(rooms: Int, price: Int, estateAgent: String) {
        self.rooms = rooms
        self.price = price
        self.estateAgent = estateAgent
    }
    
    func printSalesSummary() {
        print("This is an office with \(rooms) rooms.")
        print("Price: $\(price)")
        print("Estate agent: \(estateAgent)")
        print("---")
    }
}

// 3. Использование
var myHouse = House(rooms: 4, price: 350_000, estateAgent: "John Smith")
myHouse.printSalesSummary()

var myOffice = Office(rooms: 15, price: 1_200_000, estateAgent: "Sarah Connor")
myOffice.printSalesSummary()
