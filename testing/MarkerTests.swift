

import XCTest
@testable import unittesttest

class MarkerTests: XCTestCase {
    var defaultMarker: Marker!
    var redMarker: Marker!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        defaultMarker = Marker()
        redMarker = Marker(color: "red")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        defaultMarker = nil
        redMarker = nil
    }
    
    func testExample1() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssert(defaultMarker.color == "black")
        XCTAssert(redMarker.color == "red")
    }
    
    func testExample2() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssert(defaultMarker.draw(length: 1) == false)
    }
    
    func testExample3() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        defaultMarker.capOff()
        XCTAssert(defaultMarker.draw(length: 1) == true)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
