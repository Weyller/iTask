//==============================
import UIKit
//==============================

class SecondViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
   
    //MARKS: Variables Declaration
    //---------------------------
    @IBOutlet weak var textView: UITextView!
    
    let addOBJ = Add()
    
    var keys: [String] = []
    var values: [Bool] = []

    var dictArray: [String] = []
    
    @IBOutlet weak var btnBack: UIButton!
    //----------------------------------
    
    
    //---------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //------------------------- Load keys in temporary list
        for (key,value) in Singleton.singletonInstance.dictionary {
            
            if(value == true)
            {
                dictArray.append(key)
               
            }
            
        }
        
        // ---------------------- Change bordures des boutons
        
            btnBack.layer.cornerRadius = 5;
        //--------------------------------------------------
        
    }
    
    //MARKS: TableView Methods
    //---------------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundColor = UIColor.clear

    return dictArray.count
    }
    
    //---------------------
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = UITableViewCell(style:UITableViewCellStyle.default, reuseIdentifier:"proto")
      
        cell.textLabel!.text = dictArray[indexPath.row]
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
      
     
        let cle = Array(Singleton.singletonInstance.dictionary.keys)[indexPath.row]
            
            if editingStyle == UITableViewCellEditingStyle.delete {
                
                dictArray.remove(at: indexPath.row)
                addOBJ.removeValue(keyToRemove: addOBJ.keys[indexPath.row])
                Singleton.singletonInstance.dictionary.removeValue(forKey: cle)
        
                
                tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.automatic)
            }
       }
}
//==============================
