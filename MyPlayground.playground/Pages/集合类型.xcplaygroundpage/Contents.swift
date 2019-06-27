//: [Previous](@previous)

import Foundation

/**
 Array
 
 
 */


var pastries: [String] = ["cookie", "cupcake",  "dune", "pie"]

pastries[0...1] = ["read", "yellow", "blue"]

pastries

pastries.swapAt(1, 2)

//for pastrie in pastries {
//    print(pastrie)
//}

for (index, pastrie) in pastries.enumerated() {
    print(index, pastrie)
}

if let index = pastries.firstIndex(of: "read") {
    print(index)
}

/**
 Dictionary
 key可以任何类型
 
 */

var namesAndPets = [

    "cat" : "meow",
    "dog": "wang",
    "pig" : "piqi"

]

//print(namesAndPets["cat"])   // Optional("meow")

let mydog = namesAndPets["dog"] ?? "no dog"

print(mydog)


//更新字典值

namesAndPets.updateValue("bark", forKey: "dog")

print(namesAndPets["dog"] ?? "nodog")

namesAndPets["cat"] = "miao"

namesAndPets

namesAndPets.removeValue(forKey: "dog")


namesAndPets["cat"] = nil

print(namesAndPets)

for (key, value) in namesAndPets {
    print(("key : \(key)   value : \(value)"))
}

for (key, _) in namesAndPets {
    print(("key : \(key)"))
}

for pet in namesAndPets.values {
    print(pet)
}







//: [Next](@next)
