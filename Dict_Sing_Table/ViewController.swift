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
    }
    //---------------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //---------------------------
    @IBAction func addButton(_ sender: UIButton) {
        addObject.addValue(keyToAdd: addField.text!)
        tableView.reloadData()
        addField.text = ""
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
        selectedCell.contentView.backgroundColor = UIColor.darkGray
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
