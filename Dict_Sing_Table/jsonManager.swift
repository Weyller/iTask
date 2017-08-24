//=====================
import Foundation
import UIKit
//=====================

class jsonManager{
    
    
    var addObj = Add()
    //-----------------
    
    
     //-------------------------- Method to save data to remote server
    func saveDictionaryToJason() {
        
        let dictionary = Singleton.singletonInstance.dictionary
        var urlToSend = "http://localhost/dashboard/weyller/jsonPHP/add.php?json=["
        
       
        //var urlToSend = "http://localhost/dashboard/geneau/poo2/add.php?json=["
        
        var counter = 0
        let total = dictionary?.count
        for (a, b) in dictionary! {
            let noSpaces = a.replacingOccurrences(of: " ", with: "_")
            counter += 1
            if counter < total! {
                urlToSend += "/\(noSpaces)/,/\(b)/!"
            }
            else {
                urlToSend += "/\(noSpaces)/,/\(b)/]"
            }
        }
        // urlToSend += "]"
        
        let session = URLSession.shared
        let urlString = urlToSend
        let url = NSURL(string: urlString)
        let request = NSURLRequest(url: url! as URL)
        let dataTask = session.dataTask(with: request as URLRequest) {
            (data:Data?, response:URLResponse?, error:Error?) -> Void in
        }
        dataTask.resume()
    }
    //------------------------------------          
        
        
}
//=========================================
    
    

    
    
    
    
