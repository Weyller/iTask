//==============================
import Foundation
//==============================
class Singleton {
    //---------------------------
    static let singletonInstance = Singleton()
    var dictionnary: [String: Bool]!
    let userDefault = UserDefaults.standard
    //---------------------------
    init() {
        if userDefault.object(forKey: "data") ==  nil {
            userDefault.setValue(dictionnary, forKey: "data")
        } else {
            dictionnary = userDefault.object(forKey: "data") as! [String : Bool]!
        }
    }
    //---------------------------
    func saveData() {
        userDefault.setValue(dictionnary, forKey: "data")
    }
    //---------------------------
}
//==============================
