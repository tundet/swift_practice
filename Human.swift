/** Create a class Human which can be initialized by giving the
		name (String) as init parameter. The class should have a
		getter and a setter for both height and weight as well as
		getter for name. Additionally, the class has method for
		calculating BMI (Body Mass Index) based on height and
		weight.
		Use optionals where appropriate.
		Try out your class by creating instance(s) and different
		combinations of weight and height and check that BMI
		calculation works.
		Note: think about limitations for height and weight values and
		check in your code that values are legal.
*/
import Foundation

class Person {
    private var name: String
    private var height: Double?
    private var weight: Double?
    
    public init(name: String) {
        self.name = name
    }
    
    func getName() {
        print("name: \(self.name)")
    }
    
    func getHeight() {
        /*if(self.height == nil){
            print("set values first")
        }else{
        */print("\(self.name)'s height: \(self.height)")
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

var p1 = Person(name: "matti")
p1.getHeight()
p1.setHeight(height: 170)
p1.getHeight()
p1.setWeight(weight: 60)
p1.getWeight()
p1.getBMI()
p1.setHeight(height: 300)
