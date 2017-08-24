//==============================
import Foundation
//==============================

class Add {
    
    //MARKS: Variables declaration
    //---------------------------
    var dictionary: [String: Bool]!
    var keys: [String] = []
    var values: [Bool] = []
    
    //---------------------------
    init() {
        if let dict = Singleton.singletonInstance.dictionary {
           dictionary = dict
        } else {
            dictionary = [:]
        }
        
               parseDict()
         
    }
    
    //--------------------------- Parsing method to extract values from Dictionary
    func parseDict() {
        keys = []
        values = []
        for (k, v) in dictionary {
            keys.append(k)
            values.append(v)
           
            
        }
        
        
    }
    //--------------------------- Method to add values to dictionary
    func addValue(keyToAdd: String) {
        dictionary[keyToAdd] = false
        saveToSingleton()
    }
    //--------------------------- Method to remove a value from Dictionary
    func removeValue(keyToRemove: String) {
        dictionary[keyToRemove] = nil
        saveToSingleton()
    }
    //--------------------------- Method to keep Dictionary updated
    func saveToSingleton() {
        parseDict()
        Singleton.singletonInstance.dictionary = dictionary
        Singleton.singletonInstance.saveData()
    }
    //---------------------------
}
//==============================











