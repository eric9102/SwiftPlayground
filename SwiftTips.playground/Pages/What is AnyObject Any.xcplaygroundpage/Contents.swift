//: [Previous](@previous)

import UIKit


var myObject: AnyObject

class Person {
    
    var first: String = "first"
    var last: String = "last"
    
}

let myPerson: AnyObject = Person()

if let person = myPerson as? Person {
    print(person.first)
}


var myObject2: Any




//: [Next](@next)
