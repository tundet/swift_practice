import Foundation
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
    func getnum() -> String{
        return String(self.num)
    }
}
