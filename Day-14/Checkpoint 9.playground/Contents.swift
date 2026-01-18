func randomElementOrRandom100(from arr: [Int]?) -> Int {
    arr?.randomElement() ?? Int.random(in: 1...100)
}

let numbers = [7, 42, 13]
print(randomElementOrRandom100(from: numbers))

