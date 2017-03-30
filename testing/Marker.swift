
import Foundation

class Marker {
    private var inkLevel: Int
    private var capIsOn: Bool
    public let color: String
    private let inkFlow = 2
    
    private init(inkLevel: Int, capOn: Bool, color: String) {
        self.inkLevel = inkLevel
        self.capIsOn = capOn
        self.color = color
    }
    
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
    
    func capOff() {
        capIsOn = false;
    }
    
    func capOn() {
        capIsOn = true;
    }
}
