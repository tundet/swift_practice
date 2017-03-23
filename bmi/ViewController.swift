import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, ProtocolTest {
    @IBOutlet weak var pickerView: UIPickerView!
    var pickerData = [[String]]()
    var pickerDataHT = Array<String>()
    var pickerDataWT = Array<String>()
    var p1: Human?
    
    @IBOutlet weak var myLabel: UILabel!
    var myHeightInt:Int32 = 0
    var myWeightInt:Int32 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self
        self.p1 = Human()
        populatePickerData()
        self.p1?.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return pickerDataHT.count
        }else{
            return pickerDataWT.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[component][row]
    }
    
    @IBAction func calculateBMI(sender: Any) {
        let tempArrHT = pickerData[0][pickerView.selectedRow(inComponent: 0)].components(separatedBy: "")
        let tempArrWT = pickerData[1][pickerView.selectedRow(inComponent: 1)].components(separatedBy: "")
        
        let myHeight = getNumber(number: tempArrHT)
        print(myHeight)
        
        self.myHeightInt = Int32(myHeight)
        print(self.myHeightInt)
        
        
        if let myWeight = NumberFormatter().number(from: tempArrWT[0]){
            self.myWeightInt = Int32(myWeight.intValue)
        }
        
        p1?.calculateBMI(height: Int(self.myHeightInt), weight: Int(self.myWeightInt))
        
        
    }
    
    func populatePickerData(){
        for i in 140 ..< 200{
            self.pickerDataHT.append("\(i) cm")
        }
        
        for i in 40 ..< 110{
            self.pickerDataWT.append("\(i) kg")
        }
        self.pickerData = [self.pickerDataHT, self.pickerDataWT]
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        let tempArrHT = pickerData[0][pickerView.selectedRow(inComponent: 0)].components(separatedBy: " ")
        print(tempArrHT)
        let tempArrWT = pickerData[1][pickerView.selectedRow(inComponent: 1)].components(separatedBy: " ")
        print(tempArrWT)
        
        let myH = getNumber(number: tempArrHT[0])
        print(myH)
        self.myHeightInt = Int32(myH)
        print(self.myHeightInt)
        
        
        
        let myW = getNumber(number: tempArrWT[0])
        print(myW)
        self.myWeightInt = Int32(myW)
        print(self.myWeightInt)
        
        
        
        print("weight: \(self.myWeightInt) height: \(self.myHeightInt)")
        
        p1?.calculateBMI(height: Int(self.myHeightInt), weight: Int(self.myWeightInt))
    }
    
    func updateBMI(controller: Human, bmi: Double) {
        myLabel.text = "\(bmi)"
        print(bmi)
    }
    
    func getNumber(number: Any?) -> NSNumber {
        guard let statusNumber:NSNumber = number as? NSNumber else
        {
            guard let statString:String = number as? String else
            {
                return 0
            }
            if let myInteger = Int(statString)
            {
                return NSNumber(value:myInteger)
            }
            else{
                return 0
            }
        }
        return statusNumber
    }
    
}
