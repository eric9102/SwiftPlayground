//: [Previous](@previous)

import UIKit

var array = ["one", "two", "three"]
switch array.firstIndex(of: "four") {
case .some(let idx):
    array.remove(at: idx)
default:
    break
}

switch array.firstIndex(of: "four") {
case let idx?:
    array.remove(at: idx)
default:
    break
}

if let idx = array.firstIndex(of: "three") {
    array.remove(at: idx)
}

array

// MARK: - 同一个if语句可以绑定多个值，后面的绑定至可以基于之前的成功解包的值进行操作

let urlString = "https://www.objc.io/logo.png"
if let url = URL(string: urlString),
   let data = try? Data(contentsOf: url),
    let image = UIImage(data: data){
    
    let view = UIImageView(image: image)
    view
    
}

// MARK: - 多个 let 的任意部分也能拥有布尔值限定的语句
if let url = URL(string: urlString), url.pathExtension == "png",
   let data = try? Data(contentsOf: url),
   let image = UIImage(data: data) {
    
    let view = UIImageView(image: image)
    view
    
   }

// MARK: - 如果你需要在指定 if let 绑定之前执行某个检查的话，可以为 if 提供一个前置的条件
/**
 if segue.identifier == "showUserDetailsSegue",
 let userDetailVC = segue.destination as? UserDetailViewController
 {
     userDetailVC.screenName = "Hello"
 }
 */

// MARK: - 你可以在同一个 if 中将可选值绑定，布尔语句和 case let 混合并匹配起来使用

// let scanner = Scanner(string: "lisa123")
// var username: NSString?
// let alphas = CharacterSet.alphanumerics
//
// if scanner.scanCharacters(from: alphas, into: &username),
//    let name = username{
//    print(name)
// }
 

// while let
// MARK: - while let 语句和 if let 非常相似，它代表一个当条件返回 nil 时终止的循环。

//while let line = readLine() {
//    print(line)
//}

//可选绑定后面添加一个布尔值语句
//while let line = readLine(), !line.isEmpty {
//    print(line)
//}

let array1 = [1, 2, 3]
var iterator = array1.makeIterator()
while let i = iterator.next(){
    print(i, terminator: " ")
}

// 一个 for 循环其实就是 while 循环，这样一来，for 循环也支持布尔语句就是情理之中了，这里我们需要添加一个 where 关键字

for i in 0..<10 where i % 2 == 0 {
    print(i, terminator: " ")
}

print("\n")
var iterator2 = (0..<10).makeIterator()
while let i = iterator2.next(){
    
    if i % 2 == 0 {
        print(i)
    }

}

//

print("\n------------------- 105 ------------------\n")
var functions: [() -> Int] = []
for i in 1...3 {
    functions.append { () -> Int in
        i
    }
}

for f in functions {
    print("\(f())", terminator: " ")
}


// MARK: - 双重可选值

print("\n------------------- 120 ------------------\n")

let stringNumbers = ["1", "2", "three"]
let maybeInts = stringNumbers.map { Int($0) }

//for maybeInt in maybeInts {
//    // maybeInt 是一个 Int? 值
//    // 得到两个整数值和一个 `nil`
//}

var iterator3 = maybeInts.makeIterator()

while let maybeInt = iterator3.next() {            // iterator.next() 函数返回的其实是一个 Optional<Optional<Int>>
    print(maybeInt as Any, terminator: " ")
}

// 如果你只想对非 nil 的值做 for 循环的话，可以使用 case 来进行模式匹配
print("\n")
for case let i? in maybeInts {
    print(i, terminator: " ")
}

// 或者只对 nil 值进行循环
print("\n")
for case nil in maybeInts {
// 将对每个 nil 执行一次
    print("No value")
}
// No value

//这里使用了 x? 这个模式，它只会匹配那些非 nil 的值。这个语法是 .Some(x) 的简写形式，所以该循环还可以被写为：
print("\n")
for case let .some(i) in maybeInts {
    print(i)
}

//基于 case 的模式匹配可以让我们把在 switch 的匹配中用到的规则同样地应用到 if，for 和 while 上去。最有用的场景是结合可选值，但是也有一些其他的使用方式
print("\n")
let j = 5
if case 0..<10 = j {
    print("\(j)在范围内")
}

//
print("\n")
struct Pattern {
    let s: String
    init(_ s: String) {
        self.s = s
    }
    
}

func ~= (pattern: Pattern, value: String) -> Bool {
    return value.range(of: pattern.s) != nil
}

let s = "Taylor Swift"
if case Pattern("Swift") = s {
print("\(String(reflecting: s)) contains \"Swift\"")
}
// "Taylor Swift" contains "Swift"

print("\n------------------- 183 ------------------\n")
// MARK: - if var and while var
// 除了 let 以外，你还可以使用 var 来搭配 if、while 和 for。这么做，你就可以在语句块中改变变量了
let number = "1"
if var i = Int(number) {
    i += 1
    print(i)
}  // 2

// 解包后可选值的作用域
let array4 = [1, 2, 3]
if !array4.isEmpty {
    print(array4[0])
}

if let firstElement = array4.first {
    print(firstElement)
}

print("\n------------------- 202 ------------------\n")
// MARK: - 可选链
let str: String? = "Never say never"
// 我们希望 upper 是大写的字符串
let upper: String
if str != nil {
    upper = str!.uppercased()
} else {
// 这里没有合理的处理方法
    fatalError("no idea what to do now...")
}

//let result = str?.uppercased()
//print(result)  // Optional("NEVER SAY NEVER")

//print(str?.uppercased().lowercased())  //Optional("never say never")

//设想一个类在某个事件发生时，要通过调用存储在其中的回调函数来通知其所有者，上面的特性就会非常有用。比如有一个 TextField 类：

class TextField {
    
    private(set) var text = ""
    var didChange: ((String) -> ())?
    
    private func textDidChange(newText: String) {
        text = newText
        //如果不是nil的话，触发回调
        didChange?(text)
    }
    
}

//你还可以通过可选链来进行赋值。假设你有一个可选值变量，如果它不是 nil 的话，你想要更新它的一个属性：

struct Person {
var name: String
var age: Int
}
var optionalLisa: Person? = Person(name: "Lisa Simpson", age: 8)
// 如果不是 nil，则增加
if optionalLisa != nil {
    optionalLisa!.age += 1
}

if var lisa = optionalLisa {
// 对 lisa 的变更不会改变 optionalLisa 中的属性
    lisa.age += 1
}

//一个有点古怪 (但是逻辑上是合理) 的边界情况是它也支持对可选值的直接赋值。下面的写法是合法的：
//var a: Int? = 5
//a? = 10
//print(a)
//
//var b: Int? = nil
//b? = 10
//print(b) // nil


print("\n------------------- 261 ------------------\n")
// MARK: -nil 合并运算符

let stringteger = "1"
let number2 = Int(stringteger) ?? 0

print(number2)

//struct TimesTable {
//    let multiplier: Int
//    subscript(index: Int) -> Int {
//        return multiplier * index
//    }
//}
//
//let threeTimesTables = TimesTable(multiplier: 3)
//print(threeTimesTables[6])

let array5 = [1, 2, 3]
extension Array {
    subscript(guarded idx: Int) -> Element? {
        guard(startIndex..<endIndex).contains(idx) else {
            return nil
        }
        
        return self[idx]
    }
}

print(array5[guarded: 5] ?? 0) //0


// 有时候你可能会有多个可选值，并且想要按照顺序选取其中非 nil 的值。但是当它们全都是 nil 时，你又没有一个合理的默认值。这种情况下，你依然可以使用 ?? 操作符。不过如果最终的值是可选值的话，你得到的整个结果也将是可选值：
//
// let m = i ?? j ?? k
// type(of: m) // Optional<Int>
// 这种方式经常和 if let 配合起来使用，你可以将它想像成 “or” 版本的 if let：
//
// if let n = i ?? j {
// // 和 if i != nil || j != nil 类似
// print(n)
// }
// 如果你将 if let 的 ?? 操作符看作是和 “or” 语句类似的话，多个 if let 语句并列则等价于 “and”：
//
// if let n = i, let m = j { }
// // 和 if i != nil && j != nil 类似
// 因为可选值是链接的，如果你要处理的是双重嵌套的可选值，并且想要使用 ?? 操作符的话，你需要特别小心 a ?? b ?? c 和 (a ?? b) ?? c 的区别。前者是合并操作的链接，而后者是先解包括号内的内容，然后再处理外层：
//
// let s1: String?? = nil // nil
// (s1 ?? "inner") ?? "outer" // inner
// let s2: String?? = .some(nil) // Optional(nil)
// (s2 ?? "inner") ?? "outer" // outer
 
print("\n------------------- 314 ------------------\n")
// MARK: - 在字符串插值中使用可选值

let bodyTemperature: Double? = 37.0
let bloodGlucose: Double? = nil
//print(bodyTemperature) // Optional(37.0)
// 警告：表达式被隐式强制从 'Double?' 转换为 Any
//print("Blood glucose level: \(bloodGlucose)") // Blood glucose level: nil
// 警告：字符串插值将使用调试时的可选值描述，
// 请确认这是确实是你想要做的。

infix operator ???: NilCoalescingPrecedence
public func ???<T>(optional: T?, defaultValue: @autoclosure () -> String) -> String
{
    switch optional {
        case let value?: return String(describing: value)
        case nil: return defaultValue()
    }
}

print("Body temperature: \(bodyTemperature ??? "n/a")")
// Body temperature: 37.0
print("Blood glucose level: \(bloodGlucose ??? "n/a")")
// Blood glucose level: n/a

print("\n------------------- 339 ------------------\n")
// MARK: - 可选值map

