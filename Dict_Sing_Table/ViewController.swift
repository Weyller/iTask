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
    let managerJson = jsonManager()
    //---------------------------
    
    @IBOutlet weak var loadButton: UIButton!
    
    //-----------------------------
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //  if !Singleton.singletonInstance.dictionnary.isEmpty{
        
        //    for (k,_) in Singleton.singletonInstance.dictionnary{
        
        //       Singleton.singletonInstance.dictionnary[k] = false
        
        //   }
        //   print("Viewdidload dict: \(Singleton.singletonInstance.dictionnary)")
        
        
        //  }
        
    }
    //---------------------------
    override func viewWillAppear(_ animated: Bool) {
        
        if let index = self.tableView.indexPathForSelectedRow{
            
            self.tableView.deselectRow(at: index, animated: true)
            
        }
        
    }
    
    
    //---------------------------
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }
    
    
    //---------------------------
    @IBAction func addButton(_ sender: UIButton) {
        
        if (addField.text?.isEmpty)!
        {
            return
        }
        else
        {
            //alert("Adding one new task to the list...")
            addObject.addValue(keyToAdd: addField.text!)
            tableView.reloadData()
            addField.text = ""
            
        }
        
        
    }
    //---------------------------
    @IBAction func saveToJson(_ sender: UIButton) {
        
        //alert("Saving list to online database...")
        managerJson.saveDictionaryToJason()
        print("Data saved successfully")
    }
    //---------------------------
    @IBAction func loadJsonFromWeb(_ sender: UIButton) {
        
        let reloadAlert = UIAlertController(title: "Alert - Loading database from online site...", message: "Do you really want to load the online database and replace with this one?", preferredStyle: UIAlertControllerStyle.alert)
        
        reloadAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action: UIAlertAction!) in
            self.do_table_refresh()
        }))
        
        reloadAlert.addAction(UIAlertAction(title: "No", style: .default, handler: { (action: UIAlertAction!) in
        }))
        
        present(reloadAlert, animated: true, completion: nil)
        
    }
    //---------------------------
    
    @IBAction func resetSelection(_ sender: UIButton) {
        
        if let index = self.tableView.indexPathsForSelectedRows{
            
            print(index.count)
            for i in 0..<index.count{
                
                self.tableView.deselectRow(at: index[i], animated: true)
                
            }
            
            
        }
        for (k,_) in Singleton.singletonInstance.dictionnary{
            
            Singleton.singletonInstance.dictionnary[k] = false
            
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
        
        //print("From addOject.keys \(addObject.keys)")
        print(addObject.dictionnary)
        
        return cell
    }
    //---------------------
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath as IndexPath)!
        selectedCell.contentView.backgroundColor = UIColor.lightGray
        //--------------------------------------
        let key = addObject.keys[indexPath.row]
        
        // let isTapped = Singleton.singletonInstance.dictionnary[key] == false ? true : false
        
        // Singleton.singletonInstance.dictionnary[key] = isTapped
        
        
        //---------------------------------------------
        if !Singleton.singletonInstance.dictionnary[key]!
        {
            Singleton.singletonInstance.dictionnary[key] = true
        }
            
        else if Singleton.singletonInstance.dictionnary[key]! && selectedCell.isSelected
        {
            
            Singleton.singletonInstance.dictionnary[key] = false
        }
        else{
            
            Singleton.singletonInstance.dictionnary[key] = false
            
        }
        
        
        
        //---------------------------------------
        
        
        
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
    func do_table_refresh()
    {
        DispatchQueue.main.async(execute: {
            
            self.managerJson.loadDictionaryFromJason()
            //            self.addObject.saveToSingleton()
            self.tableView.reloadData()
           
            
        })
    }
    
    
    /* ---------------------------------------*/
    func doReloadData()
    {
        managerJson.loadDictionaryFromJason()
        
        addObject.saveToSingleton()
        self.setNeedsFocusUpdate()
        self.tableView.reloadData()
        
    }
    /* ---------------------------------------*/
    func alert(_ theMessage: String)
    {
        let refreshAlert = UIAlertController(title: "Message...", message: theMessage, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        refreshAlert.addAction(OKAction)
        present(refreshAlert, animated: true){}
    }
    
    
}
//==============================
