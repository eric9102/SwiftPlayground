//: [Previous](@previous)

import Foundation

////MARK:数组中怎么存放不同类型的元素

let numbers = [1, 2, 3, 4]
let strings = ["hello", "world"]

// Any类型隐式转换
let mixed: [Any] = [1, "two", 3]

print(type(of: mixed))

//转换为[NSObject]
let objectArray = [1 as NSObject, "two" as NSObject, 3 as NSObject]

print(type(of: objectArray))


let mixed2: [CustomStringConvertible] = [1, "two", 3]
for obj in mixed2 {
    print(obj.description)
}

//根据enum可以带值，把类型信息封装到特定的enum中
enum IntOrString {
    case IntValue(Int)
    case StringValue(String)
}

let mixed3 = [
    IntOrString.IntValue(1),
    IntOrString.StringValue("two"),
    IntOrString.IntValue(3)
]

for value in mixed3 {
    switch value {
    case let .IntValue(i):
        print(i * 2)
    case let .StringValue(s):
        print(s.capitalized)
    }

}


//: [Next](@next)
