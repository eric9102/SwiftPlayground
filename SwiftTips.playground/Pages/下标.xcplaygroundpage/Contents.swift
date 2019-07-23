//: [Previous](@previous)

import Foundation

extension Array {
    
    subscript(input: [Int]) -> ArraySlice<Element>{
        get {
            var result = ArraySlice<Element>()
            
            for i in input {
                assert(i < self.count, "Index out of range")
                result.append(self[i])
            }
            
            return result
            
        }
        
        set {
            for (index, i) in input.enumerated(){
                assert(i < self.count, "Index out of range")
                self[i] = newValue[index]
            }
        }
    }
    
}

var arr = [1, 2, 3, 4, 5]
arr[[0, 2, 3]]

arr[[0, 2, 3]] = [-1, -3, -4]
arr


//: [Next](@next)
