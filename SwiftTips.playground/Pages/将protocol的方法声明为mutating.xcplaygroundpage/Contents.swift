//: [Previous](@previous)

import UIKit


protocol Vehicle
{
    var numberOfWheels: Int { get }
    var color: UIColor { get set }
    
    mutating func changeColor()
    
    func haveAi()
    
}

struct MyCar: Vehicle {
    let numberOfWheels = 4
    var color = UIColor.blue
    
    mutating func changeColor() {
        color = .red
    }
    
    func haveAi(){
//        color = .green  //  error: cannot assign to property: 'self' is immutable
    }
}

//在使用class实现带有mutating的方法的协议时，具体是先前时不需要加mutating的



//: [Next](@next)
