//==============================
import Foundation
//==============================
class Singleton {
    //---------------------------
    static let singletonInstance = Singleton()
    var dictionary: [String: Bool]!
    var dictSelect: [String: Bool]!
    
    let userDefault = UserDefaults.standard
    //---------------------------
    init() {
        if userDefault.object(forKey: "data") ==  nil {
            userDefault.setValue(dictionary, forKey: "data")
        } else {
            dictionary = userDefault.object(forKey: "data") as! [String : Bool]!
        }
        
        if userDefault.object(forKey: "data2") ==  nil {
            userDefault.setValue(dictSelect, forKey: "data2")
        } else {
            dictSelect = userDefault.object(forKey: "data2") as! [String : Bool]!
        }

        
        
        
        
    }
    //---------------------------
    func saveData() {
        userDefault.setValue(dictionary, forKey: "data")
        userDefault.setValue(dictSelect, forKey: "data2")
    }
    //---------------------------
}
//==============================
