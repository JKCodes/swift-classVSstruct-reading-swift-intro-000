import Foundation

class Giant {
    var name: String
    var weight: Double
    var homePlanet: String
    
    init(name: String, weight: Double, homePlanet: String) {
        self.name = name
        self.weight = weight
        self.homePlanet = homePlanet
    }
}

let fred = Giant(name: "Fred", weight: 340.0, homePlanet: "Earth")

fred.name = "Brick"
fred.weight = 999.2
fred.homePlanet = "Mars" // this will not run until homePlanet is set to var

struct Alien {
    var name: String
    var height: Double
    var homePlanet: String
}

var bilbo = Alien(name: "Bilbo", height: 1.67, homePlanet: "Venus") // this must be changed to 'var' to work

bilbo.name = "Jake"
bilbo.height = 1.42
bilbo.homePlanet = "Saturn"

let edgar = Giant(name: "Edgar", weight: 520.0, homePlanet: "Earth")
let jason = edgar
jason.name = "Jason"

print(edgar.name)
print(jason.name) // Classes are reference types.  In essence, they both point to the same object

var charles = Alien(name: "Charles", height: 2.25, homePlanet: "Pluto")
var charlesFromJupiter = charles
charlesFromJupiter.homePlanet = "Jupiter"

print(charles.homePlanet)
print(charlesFromJupiter.homePlanet) // Structs are value types.  When charlesFromJupiter is created, a new copy was created

struct BankAccount {
    var owner: String
    var balance: Double
    
    mutating func deposit(_ amount: Double) {
        balance += amount
    }
    
    mutating func withdraw(_ amount: Double) {
        balance -= amount
    }
}
// Both functions above must be changed to mutating func

var joeAccount = BankAccount(owner: "Joe", balance: 100.0)
var joeOtherAccount = joeAccount
joeAccount.withdraw(50.0)

print(joeAccount.balance)
print(joeOtherAccount.balance) // Due to mutating func, only joeAccount's balance was modified

class MusicLibrary {
    var tracks: [String]
    
    init() {
        tracks = []
    }
    
    func add(track: String) {
        tracks.append(track)
    }
}

let library1 = MusicLibrary()
library1.add(track: "Michelle")
library1.add(track: "Voodoo Child")
let library2 = library1
library2.add(track: "Come As You Are")

print(library1.tracks)
print(library2.tracks) // 1) once again classes are reference types, they point to same object, so they both contain same tracks.
// 2) more interestingly, both library1 and library2 are defined as a constant.  Even though library1 is a constant, MusicLibrary is a class - reference type.  
// let prevents re-assignment to another MusicLibrary instance, but because MusicLibrary is a reference type, it's underlying properties can be modified as pleased, provided that tracks is not also a 'let'