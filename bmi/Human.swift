import Foundation

class Human: ViewController{
    var height:Int = 0
    var weight:Int = 0
    var bmi:Double = 0.0
    var delegate: MyProtocol?
    
    
    func calculateBMI(height:Int, weight:Int){
        self.height = height
        self.weight = weight
        let bmiHeight = Double(height)/100
        self.bmi = Double(weight)/(bmiHeight*bmiHeight)
        
        delegate?.updateBMI(controller: self, bmi: self.bmi)
        
    }
    
}
