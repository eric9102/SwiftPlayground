//: [Previous](@previous)

import Foundation

var string: String? = "string"

// MARK: -以下两种方式等效
var anotherString: String?? = string
var literalOptional: String?? = "string"



var aNil: String? = nil

// MARK: - 以下两种方式不等同
var anotherNil: String?? = aNil
var literalNil: String?? = nil

if anotherNil != nil {
    print("anotherNil")
}

if literalNil != nil {
    print("literalNil")
}

//: [Next](@next)
