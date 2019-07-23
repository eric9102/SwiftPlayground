//: [Previous](@previous)

import Foundation

//输入的input在函数体内部将被当做数组[Int]来使用
// 不要求可变参数在最后
//函数中的参数只能有一个是可变的

func sum(input: Int...) -> Int {
    
    return input.reduce(0, +)
    
}

print(sum(input: 1, 2, 3))

func myFunc(numbers: Int..., string: String){
    
    numbers.forEach {
        for i in 0..<$0 {
            print("\(i+1): \(string)")
        }
    }
    
}

myFunc(numbers: 1, 2, 3, string: "hello")

//: [Next](@next)
