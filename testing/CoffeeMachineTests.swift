
import XCTest
@testable import unittesttest

class CoffeeMachineTests: XCTestCase {
    var cm: CoffeeMachine!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        cm = CoffeeMachine(model: "Jurassic")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        cm = nil
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func test1() {
        XCTAssert(cm.isOn() == false)
        XCTAssert(cm.brew() == false)
    }
    
    func test2() {
        XCTAssert(cm.isOn() == false)
        cm.pressOnOff()
        XCTAssert(cm.isOn() == true)
    }
    
    func test3() {
        cm.pressOnOff()
        XCTAssert(cm.brew() == false)
    }
    
    func test4() {
        cm.pressOnOff()
        cm.fillBeans()
        XCTAssert(cm.brew() == false)
    }
    
    func test5() {
        cm.pressOnOff()
        cm.fillBeans()
        cm.fillWater()
        XCTAssert(cm.brew() == true)
    }
    
    func test6() {
        XCTAssert(cm.waterLevel() == 0)
    }
    
    func test7() {
        cm.fillWater()
        XCTAssert(cm.waterLevel() == 400)
    }
    
    func test8() {
        cm.fillWater()
        cm.fillBeans()
        cm.pressOnOff()
        var counter = 0
        while(cm.brew()) {
            counter += 1
        }
        XCTAssert(counter == 5)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
