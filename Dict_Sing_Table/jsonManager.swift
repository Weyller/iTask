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
        var urlToSend = "http://localhost:dashboard/weyller/jsonPHP/add.php?json=["

//        var urlToSend = "http://localhost:8888/dashboard/weyller/jsonPHP/add.php?json=["
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
        var dictionaryLoaded:[String: Bool] = [:]
        var keys:[String] = []
        var values:[Bool] = []
        //------------------------
        let requestURL: NSURL = NSURL(string: "http://localhost:dashboard/weyller/jsonPHP/data2.json")!
//        let requestURL: NSURL = NSURL(string: "http://localhost:8888/dashboard/weyller/jsonPHP/data2.json")!
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
                    
                    
                    print("Printing Dict: \(dict)")
                    
                    //======================
                    var index = 0
                    
                    for key in keys{
                        for _ in values{
                            
                            dictionaryLoaded[key] = values[index]
                        }
                        index += 1
                    }
                    
                    //print("Loaded dict: \(dictionaryLoaded)")
                    
                    Singleton.singletonInstance.dictionnary = dictionaryLoaded
                    
                    print(Singleton.singletonInstance.dictionnary)
            
                    
                    
                    //--------------
                }catch {
                    print("Erreur Json: \(error)")
                }
            }
        }
        task.resume()
    }
    
    //--------------------------------------------------------------
        
        
        
}

    
    

    
    
    
    
