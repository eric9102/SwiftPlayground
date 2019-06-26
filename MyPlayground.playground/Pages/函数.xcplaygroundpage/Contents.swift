
import Foundation

func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}
print(greetAgain(person: "Anna"))


/**可变参数 在变量类型名后面加入（...）的方式来定义可变参数
 注意:
一个函数最多只能拥有一个可变参数。
*/


    func arithmeticMean(_ numbers: Double...) -> Double {
        var total:Double = 0
        for number in numbers {
            total += number
        }
        
        return total / Double(numbers.count)
    }

    arithmeticMean(1, 2, 3)


/**
 输入输出参数
 函数参数默认是常量, 要想改变参数值，并且想要在这些修改在函数调用结束后仍然存在，那么就应该把这个参数定义为输入输出参数
 在参数定义前加inout关键字
*/

func swapTwoInts(_ a: inout Int,  _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")


/**
 函数类型
 1, 函数类型作为参数类型
 2,函数类型作为返回类型
 3, 嵌套函数
 */

//函数的类型是 (Int, Int) -> Int
func addTwoInts(_ m: Int, _ n: Int) -> Int {
    return m + n
}

var mathFunction: (Int, Int) -> Int = addTwoInts

print("Result: \(mathFunction(2, 3))")

print(type(of: mathFunction))


func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)
// 打印“Result: 8”

//函数作为返回类型
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

//函数嵌套
/**
 到目前为止本章中你所见到的所有函数都叫全局函数（global functions），它们定义在全局域中。你也可以把函数定义在别的函数体中，称作 嵌套函数（nested functions）。
 */

//用嵌套函数重写chooseStepFunction(backward:) 函数：

func chooseStepFunctionNew(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
var currentValue = -4
let moveNearerToZero = chooseStepFunctionNew(backward: currentValue > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")
// -4...
// -3...
// -2...
// -1...
// zero!
