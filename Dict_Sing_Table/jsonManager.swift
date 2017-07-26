//
//  jsonManager.swift
//  Dict_Sing_Table
//
//  Created by Local Admin on 2017-07-26.
//  Copyright © 2017 eleves. All rights reserved.
//

import Foundation
import UIKit
class jsonManager{
    
    
    func saveDictionaryToJason() {
        

        //--------------------------
        let dictionary = Singleton.singletonInstance.dictionnary
        var urlToSend = "http://localhost:8888/dashboard/weyller/jsonPHP/add.php?json=["
        ///Applications/XAMPP/xamppfiles/htdocs/dashboard/Weyller/jsonPHP/data.json
        // localhost/dashboard/weyller/jsonPHP/
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
    //-------------------------------------------------------------------
    
    func loadDictionaryFromJason(){
        
        
         var dict : [String: String] = [:]
        
        let requestURL: NSURL = NSURL(string: "http://localhost:8888/dashboard/weyller/jsonPHP/data.json")!
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
                    
                    for (x, y) in dict{
                        print("key: \(x) : value: \(y)" )
                    }
                    //print(json)
                    
                }catch {
                    print("Erreur Json: \(error)")
                }
            }
        }
        task.resume()
    }
    
    //--------------------------------------------------------------
        
        
        
}

    
    

    
    
    
    