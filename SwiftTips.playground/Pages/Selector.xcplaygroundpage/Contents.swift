//: [Previous](@previous)

import Foundation

class A {
    
    @objc func callMe() {
        
        print("callMe is called")
    }
    
    @objc func callOne() {
        
        let method1 = #selector(callMe)
        print(method1)
    }
}

let objA = A()
objA.callOne()



//: [Next](@next)
