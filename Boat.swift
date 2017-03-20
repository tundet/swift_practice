/*
A boat has-an engine: composition.
engine is optional property of Boat, ie. a Boat
instance might have an engine or it might not.
*/
class Boat {
 var engine:Engine?

 init() { }
}

class Engine {
 var horsePower: Double

 init(horsePower: Double) {
 	self.horsePower = horsePower
 }

 func wearUp() {
 	self.horsePower *= 0.99
 }

 func start() {
 	print("Starting \(horsePower) engine.")
 }
}

let boat = Boat()
let engine = Engine(horsePower: 99.0)

/*
?? is called the nil-coalescing operator. If the
left-hand side has an value the operator returns that.
Otherwise, operator returns right-hand side value.
*/
print(boat.engine?.horsePower ?? "none")
/*
! forces unwrapping. If there is no value, the
application crashes. Use only if you know an optional
has value at this point in the code.
*/
//print(boat.engine!.horsePower)

/*Use of ? in expressions involving optionals is called
optional chaining. In this example it is used with
if-let to give more control than nil-coalescing
operator in handling optionals.
*/
if let hp = boat.engine?.horsePower {
 print("boat engine power is \(hp)")
} else {
 print("boat has no engine")
}

boat.engine?.start()

boat.engine = engine

print(boat.engine?.horsePower ?? "none")
print(boat.engine!.horsePower)

if let hp = boat.engine?.horsePower {
 print("boat engine power is \(hp)")
} else {
 print("boat has no engine")
}
/*
? can be used with method calls - if the optional
engine exists, its start() is called; otherwise
nothing happens.
*/
boat.engine?.start()
