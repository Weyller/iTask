//==============================
import UIKit
//==============================
class SecondViewController: UIViewController {
    //---------------------------
    @IBOutlet weak var textView: UITextView!
    //---------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = String(Singleton.singletonInstance.dictionnary.count)
    }
    //---------------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //---------------------------
}
//==============================
