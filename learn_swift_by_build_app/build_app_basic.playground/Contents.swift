import UIKit

class Ship {
    
    var name = "TaiTan"
    var speed = 20
    var isFlying = false
    
    
    init(speed: Int, isFlying: Bool) {
        self.speed = speed
        self.isFlying = isFlying
    }
    
}

extension Ship {
    
    convenience init(type: String) {
        if type == "super-sonic" {
            self.init(speed: 2000, isFlying: true)
        } else {
            self.init(speed: 10, isFlying: false)
        }
    }
    
}
