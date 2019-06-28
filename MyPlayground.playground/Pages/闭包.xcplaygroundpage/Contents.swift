//: [Previous](@previous)

import Foundation

/**
 闭包是自包含的函数代码块，可以在代码中被传递和使用
 闭包可以捕获和存储其所在上下文中任意常量和变量的引用。被称为包裹常量和变量。 Swift 会为你管理在捕获过程中涉及到的所有内存操作。
 */

/**
 闭包采用3种形式
 1. 全局函数是一个有名字但不会捕获任何值的闭包
 2. 嵌套函数是一个有名字并可以捕获其封闭函数域内值的闭包
 3. 闭包表达式是一个利用轻量级语法所写的可以捕获其上下文中变量或常量值的匿名闭包
 */


//排序功能

let names = ["5000", "3000", "6000", "4000", "8000"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

//var reversedNames = names.sorted(by: backward)


/**闭包表达式语法
    
{
    (parameters) -> return type in
        statements
}

 闭包表达式参数 可以是 in-out 参数
 但不能设定默认值。如果你命名了可变参数，也可以使用此可变参数。
 限制性z元组也可以作为参数和返回值
 
*/


var reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

/** 闭包的函数体部分由关键字 in 引入
 该关键字表示闭包的参数和返回值类型定义已经完成，闭包函数体即将开始
*/

reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 } )


/** 尾随闭包
尾随闭包是一个书写在函数圆括号之后的闭包表达式，函数支持将其作为最后一个参数调用。
 在使用尾随闭包时，你不用写出它的参数标签：
*/

func someFunctionThatTakesAClosure(closure: () -> Void) {
    // 函数体部分
}


// 以下是不使用尾随闭包进行函数调用
someFunctionThatTakesAClosure(closure: {
    // 闭包主体部分
})

// 以下是使用尾随闭包进行函数调用
someFunctionThatTakesAClosure() {
    // 闭包主体部分
}

//在闭包表达式语法上章节中的字符串排序闭包可以作为尾随包的形式改写在 sorted(by:) 方法圆括号的外面：

reversedNames = names.sorted() { $0 > $1 }

//如果闭包表达式是函数或方法的唯一参数，则当你使用尾随闭包时，你甚至可以把 () 省略掉：

reversedNames = names.sorted { $0 > $1 }

print(reversedNames)



let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map {
    (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}

// strings 常量被推断为字符串类型数组，即 [String]
// 其值为 ["OneSix", "FiveEight", "FiveOneZero"]

//值捕获
/**闭包可以在其被定义的上下文中捕获常量或变量。
 即使定义这些常量和变量的原作用域已经不存在，闭包仍然可以在闭包函数体内引用和修改这些值
*/

//Swift中，可以捕获值的闭包的最简单形式是嵌套函数，也就是定义在其他函数的函数体内的函数。嵌套函数可以捕获其外部函数所有的参数以及定义的常量和变量
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)

print(incrementByTen())

print(incrementByTen())

print(incrementByTen())


//如果你创建了另一个 incrementer，它会有属于自己的引用，指向一个全新、独立的 runningTotal 变量：

let incrementBySeven = makeIncrementer(forIncrement: 7)
print(incrementBySeven())
// 返回的值为7

//闭包是引用类型

//逃逸闭包
/**
 当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行，我们称该闭包从函数中逃逸。当你定义接受闭包作为参数的函数时，你可以在参数名之前标注 @escaping，用来指明这个闭包是允许“逃逸”出这个函数的。
 */

var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}


//自动闭包








//: [Next](@next)
