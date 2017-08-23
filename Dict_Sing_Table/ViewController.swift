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
    
    var aDict: [String:Bool] = [:]
    //------------------------
    @IBOutlet weak var loadButton: UIButton!
    
    //----------------------------

    
    //-----------------------------
    override func viewDidLoad() {
        
        super.viewDidLoad()
       
        print("Viewdidload dict: \(addObject.dictionary)")
       
        
    }
    
    //---------------------------------------------------------------
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        //--------------------------
        for i in 0..<addObject.keys.count{
            
            if !addObject.dictionary.isEmpty{
                
                if (addObject.values[i]==true){
                    
                    self.tableView.selectRow(at: IndexPath(row: i, section: 0), animated: false, scrollPosition: .none)
                    
                }
                
                
            }
            
        }
        
        //-----------------------
        
        
    }
    //----------------------------------------------------------------
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.tableView.allowsMultipleSelection = true
        self.tableView.reloadData()
        let indexPath = IndexPath(row:0, section: 0) //Set your row and section
                if let cell = tableView.cellForRow(at: indexPath) {
            //--------------------------
                    for i in 0..<addObject.keys.count{
                        
                            if !addObject.dictionary.isEmpty{
                         
                                if (addObject.values[i]==true){
                                    
                                   self.tableView.selectRow(at: IndexPath(row: i, section: 0), animated: false, scrollPosition: .none)
                                    
                            }
                         
                            
                        }
                        
                   }
                   
             //-----------------------
                    
            if !addObject.dictionary.isEmpty{
                
                for (k,_) in addObject.dictionary{
                    
                    if (addObject.dictionary[k] == true){
                        
                        //cell.contentView.backgroundColor = UIColor.lightGray
                    }
                    
                }
                
            }
            
           //-------------------------
            
            
        }

        
        
        
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
            
            self.tableView.allowsMultipleSelection = true
            self.tableView.reloadData()

            //--------------------------
            for i in 0..<addObject.keys.count{
                
                if !addObject.dictionary.isEmpty{
                    
                    if (addObject.values[i]==true){
                        
                        self.tableView.selectRow(at: IndexPath(row: i, section: 0), animated: false, scrollPosition: .none)
                        
                    }
                    
                    
                }
                
            }
            
          
            
            //----------------------
            addField.text = ""
            
        }
        
    }
    //---------------------------
    @IBAction func saveToJson(_ sender: UIButton) {
        
        alert("Saving list to online database...")
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
                
                DispatchQueue.main.async { () -> Void in
                    
                    print("reloading !!!!")
                    self.tableView.reloadData()
                    
                }

            }
            
            
        }
        for (k,_) in Singleton.singletonInstance.dictionary{
            
            Singleton.singletonInstance.dictionary[k] = false
            
        }
        
    }
    
    
    //---------------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundColor = UIColor.clear
        return addObject.dictionary.count
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
        //selectedCell.contentView.backgroundColor = UIColor.lightGray
        
        //--------------------------------------
        let key = addObject.keys[indexPath.row]
        
         let isTapped = Singleton.singletonInstance.dictionary[key] == false ? true : false
        
         Singleton.singletonInstance.dictionary[key] = isTapped
    
         Singleton.singletonInstance.saveData()
       
        //---------------------------------------------
//        if !Singleton.singletonInstance.dictionary[key]!
//        {
//            Singleton.singletonInstance.dictSelect[key] = true
//        
//        } else {
//            
//            Singleton.singletonInstance.dictSelect[key] = false
//        }
//        
        
        print("Viewdidload dict: \(Singleton.singletonInstance.dictionary)")
        //---------------------------------------
        
        print("Selected keys : \(key)")
        
    }
    //---------------------
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
       
        if editingStyle == UITableViewCellEditingStyle.delete {
            addObject.removeValue(keyToRemove: addObject.keys[indexPath.row])
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.automatic)
        }
        //--------------------------------
       
        self.tableView.reloadData()
        
        //--------------------------
        for i in 0..<addObject.keys.count{
            
            if !addObject.dictionary.isEmpty{
                
                if (addObject.values[i]==true){
                    
                    self.tableView.selectRow(at: IndexPath(row: i, section: 0), animated: false, scrollPosition: .none)
                    
                }
                
                
            }
            
        }

        
    }
    //---------------------
    func do_table_refresh()
    {
        var dict : [String: String] = [:]
        var dictionaryLoaded:[String: Bool] = [:]
        var keys:[String] = []
        var values:[Bool] = []
        //------------------------
        let requestURL: NSURL = NSURL(string: "http://localhost:/dashboard/weyller/jsonPHP/data.json")!
        //let requestURL: NSURL = NSURL(string: "http://localhost/dashboard/geneau/poo2/data.json")!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(url:
            requestURL as URL)
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest as URLRequest) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                print("Tout fonctionne correctement...")
                do{
                    let json = try JSONSerialization.jsonObject(with:
                        data!, options:.allowFragments)
                    
                    dict  = json as! [String : String]
                    //======================
                    for(k, v) in dict{
                        
                        keys.append(k)
                        if(v == "false"){
                            
                            values.append(false)
                        }
                        else {
                            values.append(true)
                        }
                    }
                    
                    
                    print("Printing json: \(dict)")
                    
                    //======================
                    var index = 0
                    
                    for key in keys{
                        for _ in values{
                            
                            dictionaryLoaded[key] = values[index]
                        }
                        index += 1
                    }
                    //------------------------------
                    
            
                    
                     self.addObject.dictionary = dictionaryLoaded
                    
                    Singleton.singletonInstance.saveData()
                    
                   // print(Singleton.singletonInstance.dictionary)
                    
                    self.addObject.saveToSingleton()
                    
                    print(self.addObject.keys)
                    
                    
                            DispatchQueue.main.async { () -> Void in
                    
                                print("reloading !!!!")
                                 self.tableView.reloadData()
                                
                            }
                    
                    
                    //--------------
                }catch {
                    print("Erreur Json: \(error)")
                }
            }
        }
        task.resume()

        

    }
    

    func alert(_ theMessage: String)
    {
        let refreshAlert = UIAlertController(title: "Message...", message: theMessage, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        refreshAlert.addAction(OKAction)
        present(refreshAlert, animated: true){}
    }
    
    
}
//==============================
