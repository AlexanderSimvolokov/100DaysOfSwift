import UIKit

var beatles = ["John", "Paul", "George", "Ringo"]
let numbers = [4, 8, 15, 16, 23, 42]
var temperatures = [23.4, 28.2, 26.4]

print(beatles[0])
print(numbers[1])
print(temperatures[2])

beatles.append("Adrian")
beatles.append("Allen")
beatles.append("Adrian")
beatles.append("Novall")
beatles.append("Vivian")

var scores = Array<Int>()
scores.append(100)
scores.append(80)
scores.append(85)
print(scores[1])

/**var albums = Array<String>()
albums.append("Folklore")
albums.append("Fearless")
albums.append("Red")**/

var albums = [String]()
albums.append("Folklore")
albums.append("Fearless")
albums.append("Red")

print(albums.count)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)

characters.remove(at: 2)
print(characters.count)

characters.removeAll()
print(characters.count)

let bondMovies = ["Casino Royale", "Spectre", "No Time To Die"]
print(bondMovies.contains("Frozen"))

let cities = ["London", "Tokyo", "Rome", "Budapest"]
print(cities.sorted())

let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)

let employee2 = ["name": "Taylor Swift", "job": "Singer", "location": "Nashville"]

/**let employee2 = [
    "name": "Taylor Swift",
    "job": "Singer",
    "location": "Nashville"
]**/

print(employee2["name"] ?? "")
print(employee2["job"]!)
print(employee2["location"] as Any)
print(employee2["name", default: "Unknow"])

print(employee2["password"] ?? "")
print(employee2["status"] ?? "")
print(employee2["manager"] as Any)

let hasGraduated = [
    "Eric": false,
    "Maeve": true,
    "Otis": false,
]

let olympics = [
    2012: "London",
    2016: "Rio de Janeiro",
    2021: "Tokyo"
]

print(olympics[2012, default: "Unknown"])


var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Shaquille O'Neal"] = 216
heights["LeBron James"] = 206

var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"

archEnemies["Batman"] = "Penguin"

print("\(archEnemies["Batman1", default: "Not Found"])")

let results = [
    "english": 100,
    "french": 85,
    "geography": 75
]

let historyResult = results["history", default: 0]

let people = Set(["Denzel Washington", "Tom Cruise", "Nicolas Cage", "Samuel L Jackson"])
/**
 var people = Set<String>()
 people.insert("Denzel Washington")
 people.insert("Tom Cruise")
 people.insert("Nicolas Cage")
 people.insert("Samuel L Jackson")
**/

print(people)

var peopleArr = people.sorted()

var selected = "Monday"
selected = "Tuesday"
selected = "January"

enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

/**
enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}
**/

var day = Weekday.monday
day = Weekday.tuesday
day = Weekday.friday

/*
 var day = Weekday.monday
 day = .tuesday
 day = .friday
 */


