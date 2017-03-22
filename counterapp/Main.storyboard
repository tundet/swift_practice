import UIKit

class ViewController: UIViewController {
    
    var c1 = Counter(num: 50, minnum: 0, maxnum: 100)

    @IBOutlet weak var theLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        theLabel.text = c1.getnum()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func decreaseValue(_ sender: Any) {
        c1.decrement()
        theLabel.text = c1.getnum()
    }
    
    @IBAction func increaseValue(_ sender: Any) {
        c1.increment()
        theLabel.text = c1.getnum()
    }
    
}

