//: [Previous](@previous)

import Foundation


/**

0.  !  危险
 
1.     if let
 
 2.     guard
 
 3.     ??   默认值
 
 */

var catName: String? = nil
var catAge: Int? = 7

if let catName = catName,
    let catAge = catAge {
    
    print("the cat is \(catName) and she is \(catAge)")
    
}else{
    
    print("no cat")
    
}

func printCatInfo(catName: String?, catAge: Int?){
    
    guard let catName = catName,
        let catAge = catAge else {
            print("no cat name or cat age")
            return;
    }
    
    print("the cat is \(catName) and she is \(catAge)")
}

printCatInfo(catName: "mimi", catAge: 7)

printCatInfo(catName: nil, catAge: 10)

var optionalInt: Int? = nil
var requireResult = optionalInt ?? 0

print("optionalInt value: \(requireResult) ")

print(type(of: requireResult))


//==========
func printNickname(_ nickname: String?){
    
    guard let nickname = nickname else {
        print("no nickname")
        return
    }
    
    print("Your nickname is \(nickname)")
    
}

printNickname("kitten")
printNickname(nil)
















//: [Next](@next)
