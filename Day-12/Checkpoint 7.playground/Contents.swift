import UIKit

var greeting = "Hello, playground"

// 1. Имена классов — с большой буквы! (обязательно по Swift style guide)
class Animal {
    let legs: Int                      // лучше let — количество ног не меняется

    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    init() {
        super.init(legs: 4)            // у всех собак 4 ноги — удобно
    }

    func speak() {
        print("Woof!")
    }
}

// Подклассы собак — переопределяют speak()
class Corgi: Dog {
    override func speak() {
        print("Woof! Woof! (Corgi style)")     // чуть по-другому
    }
}

class Poodle: Dog {
    override func speak() {
        print("Yip yip! (Poodle bark)")
    }
}

class Cat: Animal {
    let isTame: Bool

    init(legs: Int = 4, isTame: Bool) {    // legs по умолчанию 4
        self.isTame = isTame
        super.init(legs: legs)
    }

    func speak() {
        print("Meow!")
    }
}

class Persian: Cat {
    override func speak() {
        print("Meeeoooow~ (с ленью и шипением)")
    }
}

class Lion: Cat {
    override func speak() {
        print("ROAR!!!")
    }
}

let corgi = Corgi()
corgi.speak()           // → Woof! Woof! (Corgi style)
print(corgi.legs)       // → 4

let poodle = Poodle()
poodle.speak()          // → Yip yip! (Poodle bark)

let persian = Persian(isTame: true)
persian.speak()         // → Meeeoooow~

let lion = Lion(isTame: false)
lion.speak()            // → ROAR!!!
