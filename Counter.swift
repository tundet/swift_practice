/*
Create a Counter class that gets initialized with minimum
and maximum values and possibly an initial value.
Counter can be incremented and decremented in range
min...max, and its value can be retrieved. Counter can
also be reset, returning it back to its initial value. Counter
value type is Int.
• Try out your counter with different initial values and usage
(method call) sequences. Pay attention to always
checking the values for validity.
*/
class Counter {
	private var min: Int
	private var max: Int
	let setmin: Int
	let setmax: Int

	init(setmin: Int, setmax: Int) {
		self.min = 0
		self.max = 5
		self.setmin = setmin
		self.setmax = setmax
	}

	convenience init() {
		self.init(setmin: 0, setmax: 5)
	}

	func reset(){
		self.min = 0
		self.max = 5
		print("Reseted, values are \(min) and \(max)")
	}

	func count(){
		self.min = self.setmin
		self.max = self.setmax
		print("Counting from \(min) to \(max)")
		while(min <= max) {
			print("\(min)")
			min += 1
		}
		print("End")
	}
	/*
	func countLineReader(min2: Int , max2: Int){
		self.min = min2
		self.max = max2
		print("Counting from \(min) to \(max)")
		while(min <= max) {
			print("\(min)")
			min += 1
		}
		print("End")
	}
	
	func bettercount(){
		print("Give minimum value")
		let num1 = readLine()
		let min2 = Int(num1!)
		print("Give maximum value")
		let num2 = readLine()
		let max2 = Int(num2!)
		countLineReader(min2: min2!, max2: max2!)
	}
	*/
}

var c1 = Counter()
// convenience init counting from 0-5
c1.count()
// asks for values
//c1.bettercount()

// set values
let c2 = Counter(setmin:2, setmax:10)
c2.count()

//reset
c2.reset()
