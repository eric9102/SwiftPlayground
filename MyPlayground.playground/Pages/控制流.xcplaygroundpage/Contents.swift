
import Foundation

var str = "Hello, playground"

var i = 1

while i<11 {
    print(i)
    i += 1
}

print("============")

repeat{
    print(i)
    i += 1
    
}while i < 15


print("============")

let useConstant = 5

let closedRange = 0...useConstant

let halfOpenRange = 0..<useConstant

var sum = 0
let count  = 10

for i in 1...count {
    sum += i
}

for _ in 0...count where count>100  {
    print("don't care")
}

for i in 1...count where i%2 == 1 {
    print("\(i) is an odd number")
}


let coordinates = (2, 2)
let pointCategory: String

switch coordinates {
case (0, 0):
    pointCategory = "origin"
case (let x, 0):
    pointCategory = "on the x-axis at \(x)"
case (0, let y):
    pointCategory = "on the y-axis at \(y)"
case let (_, y) where coordinates.0 == y:
    pointCategory = "along y = x"
case let (x, y) where y == x * x:
    pointCategory = "along y = x ^ 2"
default:
    break
}




