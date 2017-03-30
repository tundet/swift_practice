import Foundation

class CoffeeMachine {
    private var water: Int
    private var beans: Int
    public let model: String
    public var power: Bool
    
    
    private init(water: Int, beans: Int, power: Bool, model: String) {
        self.water = water
        self.beans = beans
        self.model = model
        self.power = power
    }
    
    convenience init() {
        self.init(model: "Jurassic")
    }
    
    convenience init(model: String) {
        self.init(water: 0, beans: 0, power: false, model: model)
    }
    
    func brew() -> Bool {
        if (power == true){
        while(water >= 80 && beans >= 8){
            water -= 30
            beans -= 8
            print("Brewed coffee")
            return true
        }
        }
        return false
    }
    
    func isOn() -> Bool {
        if(power == false){
            return false
        } else {
            return true
        }
    }
    
    func pressOnOff() {
        if(power == false){
            power = true
        } else {
            power = false
        }
    }
    
    func fillBeans() {
        beans += 40
        
    }
    func fillWater() {
        water += 400
    }
    
    func waterLevel() -> Int {
        return water
    }
}
