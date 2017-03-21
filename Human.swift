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
class Human {
	var name: String
	var height: Int
	var weight: Int
	var bmi: Int

	private init(name: String, height: Int, weight: Int, bmi: Int) {
		self.name = name
		self.height = height
		self.weight = weight
		self.bmi = bmi
	}

	convenience init(name: String) {
		self.init(name: name)
	}

	func calculateBMI(height: Int, weight: Int){
		if(height > 130 && height < 200 && weight > 35 && weight < 200){
			bmi = weight/height
			print("Your BMI is \(bmi)")
		}else{
			print("Something is not right")
		}
	}
}

var john = Human(name: "John")
john.calculateBMI(height: 120, weight: 60)
