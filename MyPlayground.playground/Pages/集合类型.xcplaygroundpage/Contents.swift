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
    "dog": "wang"

]

//print(namesAndPets["cat"])   // Optional("meow")

let mydog = namesAndPets["dog"] ?? "no dog"

print(mydog)
























//: [Next](@next)
