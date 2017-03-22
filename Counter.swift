/* Create a Counter class that gets initialized with minimum
and maximum values and possibly an initial value.
Counter can be incremented and decremented in range
min...max, and its value can be retrieved. Counter can
also be reset, returning it back to its initial value. Counter
value type is Int.
Try out your counter with different initial values and usage
(method call) sequences. Pay attention to always
checking the values for validity.
*/

class Counter {
    private var initnum: Int
    private var num: Int
    private var maxnum: Int
    private var minnum: Int
    
    public init(num: Int, minnum: Int, maxnum: Int) {
        self.num = num
        self.initnum = num
        self.maxnum = maxnum
        self.minnum = minnum
    }
    
    func increment() {
        if (self.num == self.maxnum) {
            print("maximum reached")
        } else {
            self.num += 1
            print("incremented. value: \(self.num)")
        }
    }
    
    func decrement() {
        if (self.num == self.minnum) {
            print("minimum reached")
        } else {
            self.num -= 1
            print("decremented. value: \(self.num)")
        }
    }
    
    func reset() {
        self.num = self.initnum
        print("reset. value: \(self.num)")
    }
    func getnum(){
        print("value: \(self.num)")
    }
}

var c1 = Counter(num: 5, minnum: 2, maxnum: 7)
c1.getnum()
c1.increment()
c1.increment()
c1.increment()
c1.reset()

var c2 = Counter(num: 3, minnum: 2, maxnum: 7)
c2.getnum()
c2.decrement()
c2.decrement()
c2.reset()
