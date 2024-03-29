
import Foundation

/**
 
 构造
 与 Objective-C 中的构造器不同，Swift 的构造器没有返回值。它们的主要任务是保证某种类型的新实例在第一次使用前完成正确的初始化
 
 */

/**
 存储属性的初始赋值
 类和结构体在创建实例时，必须为所有存储型属性设置合适的初始值。存储型属性的值不能处于一个未知的状态。
 
 你可以在构造器中为存储型属性设置初始值，也可以在定义属性时分配默认值
 
 注意
 当你为存储型属性分配默认值或者在构造器中为设置初始值时，它们的值是被直接设置的，不会触发任何属性观察者。
 
 */

struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}
var f = Fahrenheit()
print("The default temperature is \(f.temperature)° Fahrenheit")
// 打印“The default temperature is 32.0° Fahrenheit”

/**
 自定义构造过程
 */

struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    
    init(_ celsius: Double){
        temperatureInCelsius = celsius
    }
}

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
// boilingPointOfWater.temperatureInCelsius 是 100.0
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
// freezingPointOfWater.temperatureInCelsius 是 0.0

struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red   = red
        self.green = green
        self.blue  = blue
    }
    init(white: Double) {
        red   = white
        green = white
        blue  = white
    }
}
let veryGreen = Color(red: 0.0, green: 1.0, blue: 0.0)

let bodyTemperature = Celsius(37)

/**
 
 可选属性类型
 如果你自定义的类型有一个逻辑上允许值为空的存储型属性——无论是因为它无法在初始化时赋值，还是因为它在之后某个时机可以赋值为空——都需要将它声明为 可选类型。可选类型的属性将自动初始化为 nil，表示这个属性是特意在构造过程设置为空
 
 */

class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}

let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
// 打印“Do you like cheese?”
cheeseQuestion.response = "Yes, I do like cheese."
print(cheeseQuestion.response ?? "default value")

/**
 
 构造过程中常量属性的赋值
 
 你可以在构造过程中的任意时间点给常量属性赋值，只要在构造过程结束时它设置成确定的值。一旦常量属性被赋值，它将永远不可更改。
 对于类的实例来说，它的常量属性只能在定义它的类的构造过程中修改；不能在子类中修改
 
 */


//默认构造器


//指定构造器和便利构造器的语法

/**
 init(parameters) {
 statements
 }
 
 convenience init(parameters) {
 statements
 }
 
 为了简化指定构造器和便利构造器之间的调用关系，Swift 构造器之间的代理调用遵循以下三条规则：
 规则 1
         指定构造器必须调用其直接父类的的指定构造器。
 规则 2
         便利构造器必须调用同类中定义的其它构造器。
 规则 3
         便利构造器最后必须调用指定构造器。
 一个更方便记忆的方法是：
 指定构造器必须总是向上代理
 便利构造器必须总是横向代理
 
 */


/**
 构造器的继承和重写
 
 Swift 中的子类默认情况下不会继承父类的构造器
 */

class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}

class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}


class Ship {
    
    var name: String = "missing name"
    var speed = 0
    var isFlying = true
    lazy var permit: Permit = Permit(validUntil: 2100)
    
    init(speed: Int, isFlying: Bool) {
        self.speed = speed
        self.isFlying = isFlying
    }
    
    convenience init(speed: Int) {
        
        self.init(speed: speed, isFlying: false)
        
    }
    
}

class Permit {
    var validUntil  = 2017
    
    init(validUntil: Int) {
        self.validUntil = validUntil
        print("Permit object is contruct")
    }
    
    deinit {
        print("Permit instance is destroyed")
    }
    
}

let ship = Ship(speed: 20)

ship.permit

