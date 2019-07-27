//: [Previous](@previous)

import Foundation

struct Person {
    let name: String
    let age: Int
}

let xiaoMing = Person(name: "xiiaoming", age: 16)
let r = Mirror(reflecting: xiaoMing)
print("xiaoMing iS \(r.displayStyle)")

print("属性个数: \(r.children.count)")
for child in r.children {
    print("属性名：\(String(describing:child.label)), 值：\(child.value)")
}


//: [Next](@next)
