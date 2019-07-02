
import Foundation


struct TimesTable {
    
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
    
}

let threeTimesTable = TimesTable(multiplier: 3)

print("six times three is \(threeTimesTable[6])")


var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
numberOfLegs["bird"] = 2

print(numberOfLegs)


/**
 
 下标选项
 下标可以接受任意数量的入参，并且这些入参可以是任意类型。下标的返回值也可以是任意类型。
 下标可以使用可变参数，并且可以提供默认参数数值，但是不能使用输入输出参数
 一个类或结构体可以根据自身需要提供多个下标实现，使用下标时将通过入参的数量和类型进行区分，自动匹配合适的下标，这就是下标的重载
 
 */
