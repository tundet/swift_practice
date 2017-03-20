import Foundation

/*
Marker class is a base class, does not inherit from any
other class. Instance variables (var) and constants
(let) are private (no access outside Marker class),
except for read-only color
*/
class Marker {
 private var inkLevel: Int
 private var capIsOn: Bool
 let color: String
 private let inkFlow = 2

 private init(inkLevel: Int, capOn: Bool, color: String) {
	 self.inkLevel = inkLevel
	 self.capIsOn = capOn
	 self.color = color
 }

/*
Designated (initializes the instance fully) initializer in
this example is private. Convenience initializers
provide alternate ways to initialize the instance. All
initializers have the name init. When referring to
instance variables self is used in the same way as this
in Java. Note that parameters are named in calls
(self.init(color: "black") , for example)
*/
 convenience init() {
	 self.init(color: "black")
 }

 convenience init(color: String) {
	 self.init(inkLevel: 100, capOn: true, color: color)
 }

 func draw(length: Int) -> Bool {
	if(!capIsOn && (inkLevel >= (length * inkFlow))) {
		 inkLevel -= length * inkFlow
		 print("drawing \(length) of \(color)")
		 return true
	 } else {
		 return false
	 }
 }

/*Methods, introduced with func keyword, have default
access control level (internal - visible in the same
module. Module typically is the app or a framework).
Return type is marked with -> after the method
parameter list. Default is void.
*/
 func capOff() {
	 capIsOn = false;
 }

 func capOn() {
	 capIsOn = true;
 }
}

/*Two instances (m1 and m2) of Marker class are
created and initialized, using both of possible
initializers.
*/
var m1 = Marker()
let m2 = Marker(color: "red")

m1.capOff()
m2.capOff()

/*Method calls are made using dot syntax like in Java.
Note parameter names in calls.
*/
while(m2.draw(length: 8)) {
 m1.draw(length: 13)
}
