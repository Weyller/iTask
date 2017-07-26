//==============================
import UIKit
//==============================
class SecondViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    //---------------------------
    @IBOutlet weak var textView: UITextView!
    
    let addOBJ = Add()
    
    var dic: [String: Bool]!
    var keys: [String] = []
    var values: [Bool] = []

    
    
    //---------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("")
        print("les valeurs: \(addOBJ.dictionnary!)")

       // textView.text = String(describing: addOBJ.dictionnary!)

        //textView.text = String(Singleton.singletonInstance.dictionnary.count)
        
        //-----------
        
        print("The keys selected:")
        
        for (key,value) in Singleton.singletonInstance.dictionnary {
            
            
            if(value == true)
            {
                print(key)
            }
            
        }
        
      
        
        
        
        
    }
    //---------------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //---------------------------
    
    //---------------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundColor = UIColor.clear
        return addOBJ.dictionnary.count
    }
    //---------------------
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style:UITableViewCellStyle.default, reuseIdentifier:"proto")
        
       // cell.textLabel!.text = addOBJ.keys[indexPath.row]
       //--------------------
        
            if(addOBJ.values[indexPath.row] == true)
            {
                cell.textLabel!.text = addOBJ.keys[indexPath.row]
                

            
        }

        
        
        //--------------------
        cell.textLabel?.textColor = UIColor.black
        cell.backgroundColor = UIColor.clear
      
        return cell
    }
    //---------------------
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath as IndexPath)!
        selectedCell.contentView.backgroundColor = UIColor.blue
    }
    //---------------------
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
           addOBJ.removeValue(keyToRemove: addOBJ.keys[indexPath.row])
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    //---------------------
    
    
    
    
    
}
//==============================
