//==============================
import UIKit
//==============================
class SecondViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    //---------------------------
    @IBOutlet weak var textView: UITextView!
    
    let addOBJ = Add()
    
    var keys: [String] = []
    var values: [Bool] = []

    var dictArray: [String] = []
    
    
    //---------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("")
        print("les valeurs: \(addOBJ.dictionary!)")
        print("Singleton: \(Singleton.singletonInstance.dictionary!)")

        //-----------
        
        print("The keys selected:")
                
        for (key,value) in Singleton.singletonInstance.dictionary {
            
            if(value == true)
            {
                dictArray.append(key)
                print(key)
            }
            
        }
        //----------------------------------------
        
        print("dictArray: \(dictArray)")
        
        
    }
    
    
    //---------------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundColor = UIColor.clear
//return addOBJ.dictionary.count
    return dictArray.count
    }
    //---------------------
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style:UITableViewCellStyle.default, reuseIdentifier:"proto")
      
        //            if(addOBJ.values[indexPath.row] == true)
//            {
//                cell.textLabel!.text = addOBJ.keys[indexPath.row]
//              
//            }

//        if(Array(Singleton.singletonInstance.dictionary.values)[indexPath.row] == true){
//            
//            cell.textLabel!.text = addOBJ.keys[indexPath.row]
//        }
        
    
        cell.textLabel!.text = dictArray[indexPath.row]
        
        
        
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
            
            let cle = Array(Singleton.singletonInstance.dictionary.keys)[indexPath.row]
            
            if editingStyle == UITableViewCellEditingStyle.delete {
                
                dictArray.remove(at: indexPath.row)
                // addOBJ.removeValue(keyToRemove: addOBJ.keys[indexPath.row])
                 Singleton.singletonInstance.dictionary.removeValue(forKey: cle)
                tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.automatic)
            }
    //---------------------
        }
    }
}
//==============================
