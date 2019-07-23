//: [Previous](@previous)

import Foundation

class Cat {
    
    var name: String
    
    init() {
        name = "cat"
        print("Cat init is called")
    }
    
}

class Tiger: Cat {
    
    let power: Int
    
    override init(){
        power = 10
//        super.init()
//        name = "tiger"
    }
    
}

let tiger = Tiger()

tiger.name


//: [Next](@next)
