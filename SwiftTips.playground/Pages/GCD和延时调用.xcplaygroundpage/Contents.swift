//: [Previous](@previous)

import Foundation

let workingQueue = DispatchQueue(label: "my_queue")
workingQueue.async{
    
    print("work hard")
    
    Thread.sleep(forTimeInterval: 2)
    
    DispatchQueue.main.async{
        print("finish work , update ui")
    }
    
}


//: [Next](@next)
