//: [Previous](@previous)

import Foundation


/**
 存储属性
 类型属性
 
 属性观察器监测 存储属性值的变化
 
 常量结构体实例的存储属性 值无法修改
 
 */


struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
// 该区间表示整数 0，1，2
rangeOfThreeItems.firstValue = 6
// 该区间现在表示整数 6，7，8

/**
 
 延时加载存储属性:
 是指当第一次被调用的时候才会计算其初始值的属性
 在属性声明前使用 lazy 来标示一个延时加载存储属性
 注意
 如果一个被标记为 lazy 的属性在没有初始化时就同时被多个线程访问，则无法保证该属性只会被初始化一次。
*/

class DataImporter {
    /*
     DataImporter 是一个负责将外部文件中的数据导入的类。
     这个类的初始化会消耗不少时间。
     */
    var fileName = "data.txt"
    // 这里会提供数据导入功能
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
    // 这里会提供数据管理功能
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
// DataImporter 实例的 importer 属性还没有被创建

print(manager.importer.fileName)

/**
 
 计算属性
 除存储属性外，类、结构体和枚举可以定义计算属性。计算属性不直接存储值，而是提供一个 getter 和一个可选的 setter，来间接获取和设置其他属性或变量的值
 
 
 */



/**
 
 只读计算属性的声明可以去掉 get 关键字和花括号
 
 */

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
// 打印“the volume of fourByFiveByTwo is 40.0”


/**
 
 属性观察器
 
 可以为属性添加其中一个或两个观察器：
 willSet 在新的值被设置之前调用
 didSet 在新的值被设置之后调用
 
 */

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("将 totalSteps 的值设置为 \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("增加了 \(totalSteps - oldValue) 步")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
// 将 totalSteps 的值设置为 200
// 增加了 200 步
stepCounter.totalSteps = 360
// 将 totalSteps 的值设置为 360
// 增加了 160 步
stepCounter.totalSteps = 896
// 将 totalSteps 的值设置为 896
// 增加了 536 步


/**
 
 全局变量和局部变量
 全局变量是在函数、方法、闭包或任何类型之外定义的变量。局部变量是在函数、方法或闭包内部定义的变量。
 全局或局部变量都属于存储型变量
 另外，在全局或局部范围都可以定义计算型变量和为存储型变量定义观察器。计算型变量跟计算属性一样，返回一个计算结果而不是存储值，声明格式也完全一样
 
 ***全局的常量或变量都是延迟计算的，跟 延时加载存储属性 相似，不同的地方在于，全局的常量或变量不需要标记 lazy 修饰符。
 局部范围的常量和变量从不延迟计算。***
 
 */


/**
 
 类型属性
 为类型本身定义属性，无论创建了多少个该类型的实例，这些属性都只有唯一一份。这种属性就是类型属性。
 类型属性用于定义某个类型所有实例共享的数据，比如所有实例都能用的一个常量（就像 C 语言中的静态常量），或者所有实例都能访问的一个变量（就像 C 语言中的静态变量）。
 存储型类型属性可以是变量或常量，计算型类型属性跟实例的计算型属性一样只能定义成变量属性。
 
 */

//使用关键字 static 来定义类型属性。在为类定义计算型类型属性时，可以改用关键字 class 来支持子类对父类的实现进行重写。下面的例子演示了存储型和计算型类型属性的语法

struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}
class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

print(SomeStructure.storedTypeProperty)
// 打印“Some value.”
SomeStructure.storedTypeProperty = "Another value."
print(SomeStructure.storedTypeProperty)
// 打印“Another value.”
print(SomeEnumeration.computedTypeProperty)
// 打印“6”
print(SomeClass.computedTypeProperty)
// 打印“27”

//: [Next](@next)
