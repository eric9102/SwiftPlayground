//: [Previous](@previous)

import Foundation

protocol Copyable {
    func copy() -> Self
}

class MyClass: Copyable {
    
    var num = 1
    
    func copy() -> Self {
        
        let result = type(of: self).init()
        result.num = num
        return self
        
    }
    
    required init() {
        
    }
    
}

let object = MyClass()
object.num = 100

let newObject = object.copy()
object.num = 1

print(object.num)
print(newObject.num)


//: [Next](@next)
