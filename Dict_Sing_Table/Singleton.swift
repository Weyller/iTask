//==============================
import Foundation
//==============================
class Singleton {
    //---------------------------
    static let singletonInstance = Singleton()
    var dictionnary: [String: Bool]!
    var dictSelect: [String: Bool]!
    
    let userDefault = UserDefaults.standard
    //---------------------------
    init() {
        if userDefault.object(forKey: "data") ==  nil {
            userDefault.setValue(dictionnary, forKey: "data")
        } else {
            dictionnary = userDefault.object(forKey: "data") as! [String : Bool]!
        }
        
        if userDefault.object(forKey: "data2") ==  nil {
            userDefault.setValue(dictSelect, forKey: "data2")
        } else {
            dictSelect = userDefault.object(forKey: "data2") as! [String : Bool]!
        }

        
        
        
        
    }
    //---------------------------
    func saveData() {
        userDefault.setValue(dictionnary, forKey: "data")
        userDefault.setValue(dictSelect, forKey: "data2")
    }
    //---------------------------
}
//==============================
