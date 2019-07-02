
import Foundation

/**
 
 在 Swift 中，继承是区分「类」与其它类型的一个基本特征
 
 */

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // 什么也不做——因为车辆不一定会有噪音
        print("This is base method")
    }
}

let somVehicle = Vehicle()

print(somVehicle.description)

/**
 
 定义子类：
 class SomeClass: SomeSuperclass {
 // 这里是子类的定义
 }
 
 */

class Bicycle: Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true

bicycle.currentSpeed = 15.0

print("Bicycle: \(bicycle.description)")



class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")

/**
 
 重写：
 子类可以为继承来的实例方法，类方法，实例属性，类属性，或下标提供自己定制的实现。我们把这种行为叫重写
 
 重写某个特性，你需要在重写定义的前面加上 override 关键字
 
 */

class SomeCar: Vehicle {
    
    override func makeNoise() {
        
        super.makeNoise()
        print("This is son method")
    }
    
}

let benzi = SomeCar()
print(benzi.makeNoise())


//重写属性---重写属性的 Getters 和 Setters

class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")
// 打印“Car: traveling at 25.0 miles per hour in gear 3”

// 重写属性观察器
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")
// 打印“AutomaticCar: traveling at 35.0 miles per hour in gear 4”

/**
 防止重写
把方法，属性或下标标记为 final 来防止它们被重写
 只需要在声明关键字前加上 final 修饰符即可（例如：final var、final func、final class func 以及 final subscript）
*/
