//: [Previous](@previous)

import Foundation

let name = ["王小二", "张三", "李四", "王二小"]
name.forEach {
    switch $0 {
    case let x where x.hasPrefix("王"):
        print("\(x) is wang")
    default:
        print("hello, \($0)")
    }
}


let num: [Int?] = [48, 99, nil]
let n = num.flatMap {$0}

for score in n where score > 60 {
    print("及格啦 - \(score)")
}

print("-------------------------------------")

/**
 在Swift3后，if let 和 guard let 的条件不再使用where语句，用逗号写在 if 或者guard的后面
 */

num.forEach{
    
    if let score = $0, score > 60 {
        print("及格啦 - \(score)")
    }else{
        print(":(")
    }
    
}

//: [Next](@next)
