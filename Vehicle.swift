class Vehicle {
/** speed property can only be accessed in code which
	resides in the same file. registerId has internal
	visibility (but note it can’t be changed, only read)
*/
 fileprivate var speed = 0.0
 let registerId: String

//Both initializers can be accessed
 init(registerId: String) {
 	self.registerId = registerId
 }
 convenience init() {
 	self.init(registerId: "unknown")
 }
}

/** A car is-a vehicleCar: inheritance. Car inherits from
	Vehicle speed and registerId. It additinally has
	acceleration constant and an optional topSpeed
	variable.
*/
class Car: Vehicle {
 private let acceleration: Double
 fileprivate var topSpeed: Double?

 init(registerId: String, acceleration: Double) {
	 //acceleration needs to be initialized before call to superclass (Vehicle) initializer. 
	 //Note: topSpeed does not have a value - accelerate() method needs to work nonetheless.
	 self.acceleration = acceleration
	 super.init(registerId: registerId)
 }

 //Use nil-coalescing operator ?? give a default value in case topSpeed doesn’t have a value
 func accelerate() {
	 let newSpeed = self.speed * (1.0 + acceleration/(self.speed + 1.0)) + 0.1
	 let maxSpeed = topSpeed ?? 160.0

	 if(newSpeed <= maxSpeed) {
		 self.speed = newSpeed
	 } else {
		 self.speed = maxSpeed
	 }
 }

 func speed() -> Double {
	 return self.speed
 }
}

/** Protocol gives requirements for a class that
	implements it. Requirements are typically method
	signatures (method name, parameters, return type)
	and/or instance variable declaration rules.
	Corresponding concept in Java is interface.
*/

//Honking has one method, honk() that returns a String.
protocol Honking {
 func honk() -> String
}

//Convertible requires class to implement two methods, and additionally an instance variable with both a setter and a getter.
protocol Convertible {
 var roofIsDown: Bool { get set }
 func roofDown()
 func roofUp()
}

/** SportsCar inherits from Car and implements
	both Honking and Convertible.
	roofIsDown must be defined.
*/
class SportsCar: Car, Honking, Convertible {
 var roofIsDown: Bool
//SportsCar has an initializer just like superclass Car, “override” is necessary.
//Note the order of instance variable initializations. 
//In a SportsCar object topSpeed has a value (in Car it doesn’t necessarily have).
 override init(registerId: String, acceleration: Double) {
	 self.roofIsDown = false
	 super.init(registerId: registerId, acceleration: acceleration)
	 super.topSpeed = 250.0
 }

 func honk() -> String {
	 return "honk-Honk-HONK"
 }

//SportsCar must implement honk() from Honking, and roofUp() and roofDown() from Convertible.
//The declarations must be exactly as declared in the protocol.
 func roofUp() {
	 if(roofIsDown) {
		 print("raising roof")
		 roofIsDown = false
	 }
 }

 func roofDown() {
	 if(!roofIsDown) {
		 print("folding roof")
		 roofIsDown = true
	 }
 }
}

//Create cars and a sportscar.
var c1 = Car(registerId: "ABC-987", acceleration: 10.0)
let c2 = Car(registerId: "SLOW-00", acceleration: 2.0)
let s1 = SportsCar(registerId: "FAST-99", acceleration: 18.0)

//Put all cars into an array. Type of the array is inferredto be [ Car ].
//(Alt-click in Xcode to see this.)
let cars = [ c1, c2, s1 ]

s1.roofDown()
s1.roofUp()

/** Outer iteration over a range, inner over a collection. as is for type
	downcasting, as? does a conditional downcast whereas as! forces
	downcast and can cause runtime error. (Type check operator is is, for
	example ...if car is SportsCar… )
*/
for i in 1...22 {
 for car in cars {
	 print("car \(car.registerId) speed is \(car.speed())")
	 car.accelerate()
	 if let sportsCar = car as? SportsCar {
		 print(sportsCar.honk())
	 }
 }
}
