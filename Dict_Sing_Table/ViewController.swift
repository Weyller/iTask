//==============================
import UIKit
//==============================
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    //---------------------------
    @IBOutlet weak var addField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    //---------------------------
    let addObject = Add()
    //---------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for (k,_) in Singleton.singletonInstance.dictionnary{
            Singleton.singletonInstance.dictionnary[k] = false
        }
        print("Viewdidload dict: \(Singleton.singletonInstance.dictionnary)")
        
    }
    //---------------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //---------------------------
    @IBAction func addButton(_ sender: UIButton) {
        
        if (addField.text?.isEmpty)!
        {
          return
        }
        else
        {
            addObject.addValue(keyToAdd: addField.text!)
            tableView.reloadData()
            addField.text = ""
        }
        
       
    }
    //---------------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundColor = UIColor.clear
        return addObject.dictionnary.count
    }
    //---------------------
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style:UITableViewCellStyle.default, reuseIdentifier:"proto")
        cell.textLabel!.text = addObject.keys[indexPath.row]
        cell.textLabel?.textColor = UIColor.black
        cell.backgroundColor = UIColor.clear
        return cell
    }
    //---------------------
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath as IndexPath)!
       selectedCell.contentView.backgroundColor = UIColor.lightGray
        //--------------------------------------
        let key = addObject.keys[indexPath.row]

       
//        var aDict = Singleton.singletonInstance.dictionnary!
//        
//        if !Array(aDict.values)[indexPath.row] {
//            aDict[Array(aDict.keys)[indexPath.row]] = true
//        } else {
//            aDict[Array(aDict.keys)[indexPath.row]] = false
//        }
//        
//        
//        print("adict: \(aDict)")
    
       // let isTapped = Singleton.singletonInstance.dictionnary[key] == false ? true : false
        
       // Singleton.singletonInstance.dictionnary[key] = isTapped
        
        
        //---------------------------------------------
        if !Singleton.singletonInstance.dictionnary[key]!
        {
            Singleton.singletonInstance.dictionnary[key] = true
                    }
        else{
            Singleton.singletonInstance.dictionnary[key] = false
            
        }
        
        
        
        //---------------------------------------
        //
        

        print("Singleton: \(Singleton.singletonInstance.dictionnary)")
    }
    //---------------------
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            addObject.removeValue(keyToRemove: addObject.keys[indexPath.row])
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    //---------------------
}
//==============================
