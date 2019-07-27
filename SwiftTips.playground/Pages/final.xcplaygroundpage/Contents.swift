//: [Previous](@previous)

import Foundation

/**
 final关键字可以用在class, func 或者var前面进行修饰，表示不允许继承或者重写
 什么情况下会使用final
 1， 类或者方法的功能确实已经完备了
 2，子类继承和修改是一件危险的事情
 3，为了父类中的某些代码一定会被执行
 4，性能考虑
*/

class Parent {
    
    final func method() {
        
        print("开始配置")
        
        methodImpl()
        
        print("结束配置")
    }
    
    func methodImpl() {
        fatalError("子类必须实现这个方法")
    }
    
}

class Child: Parent {
    override func methodImpl() {
        print("methodImpl 子类实现")
    }
}

let xiaoming = Child()
print(xiaoming.method())

//: [Next](@next)
