//: [Previous](@previous)

import Foundation

func doWork(block: ()->()) {   //block()在方法内是同步执行的

    block()
    
}


doWork {
    print("work")
}

// MARK: - @escaping 逃逸闭包

func doWorkAsync(block: @escaping ()->()) {

    DispatchQueue.main.async {
        block()
    }
    
}

class S {
    var foo = "foo"
    
    func method1() {
        
        doWork {
            print(foo)
        }
        
        foo = "bar"
        
    }
    
    func method2() {
        
        doWorkAsync {
            print(self.foo)    // Reference to property 'foo' in closure requires explicit 'self.' to make capture semantics explicit
        }
        
        foo = "bar"
        
    }
    
    // MARK: - 如果不想在闭包中持有self，可以使用[weak self]的方式来表达
    func method3() {
        
        doWorkAsync {
            [weak self] in
            print(self?.foo ?? "nil")
        }
        
        foo = "bar"
        
    }
    
    
    
}

S().method1()    // foo
S().method2()   //闭包持有了self，打印的事最后对foo赋值后的内容bar

S().method3()

//: [Next](@next)
