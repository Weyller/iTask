//==============================
import Foundation
//==============================

class Singleton {
    
    //MARKS: Variables Declaration
    //---------------------------
    static let singletonInstance = Singleton()
    var dictionary: [String: Bool]!
    
    //MARKS: UserDefault for data persistence
    let userDefault = UserDefaults.standard
    //---------------------------
    init() {
        if userDefault.object(forKey: "data") ==  nil {
            userDefault.setValue(dictionary, forKey: "data")
        } else {
            dictionary = userDefault.object(forKey: "data") as! [String : Bool]!
        }
        
        
    }
    //--------------------------- Update userdefaults and Dictionary
    func saveData() {
        userDefault.setValue(dictionary, forKey: "data")
    }
    //---------------------------
}
//==============================
