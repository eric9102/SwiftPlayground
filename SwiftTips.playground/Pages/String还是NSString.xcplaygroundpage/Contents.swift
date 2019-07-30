//: [Previous](@previous)

import Foundation

let levels  = "ABCDE"
for i in levels {
    print(i)
}

if (levels as NSString).contains("BC") {
    print("contains BC")
}

print(levels.contains("BC"))

//: [Next](@next)
