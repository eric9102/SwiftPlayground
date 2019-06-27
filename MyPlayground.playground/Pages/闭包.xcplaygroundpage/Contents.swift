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

























//: [Next](@next)
