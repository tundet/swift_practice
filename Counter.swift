import Foundation

class Person {
    private var name: String
    private var height: Double?
    private var weight: Double?
    
    init(name: String) {
        self.name = name
    }
    
    func getName() {
        print("name: \(self.name)")
    }
    
    func getHeight() {
        if(self.height == nil){
         print("set values first")
         }else{
         print("\(self.name)'s height: \(self.height)")
        }
    }
    
    func setHeight(height: Double) {
        if (height > 200 || height < 140) {
            print("incorrect value")
        } else {
            self.height = height
        }
    }
    
    func getWeight() {
        print("\(self.name)'s weight: \(self.weight)")
    }
    
    func setWeight(weight: Double) {
        if (weight > 200 || weight < 30) {
            print("incorrect value")
        } else {
            self.weight = weight
        }
    }
    
    func getBMI() {
        if (self.height != nil && self.weight != nil) {
            let bmi = self.weight! / (self.height! * 2) * 100
            print("bmi: \(bmi)")
        } else {
            print("values missing")
        }
    }
}

var i = 6

var p1 = Person(name: "matti")
p1.getHeight()
p1.setHeight(height: 170)
p1.getHeight()
p1.setWeight(weight: 60)
p1.getWeight()
p1.getBMI()
p1.setHeight(height: 300)
