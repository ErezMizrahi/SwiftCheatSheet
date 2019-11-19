//
//  Clear Quotes.swift
//  SwiftCheatSheet
//
//  Created by Erez Mizrahi on 19/11/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//

import Foundation
extension Dictionary where  Key == String, Value == Any{
var quoteClearDictionary : [String:Any]{
       get{
           let jsonConvertKeys : [String] = ["images"]
           
           var dict : [String:Any] = [:]
           for (key,val) in self{
               if let str = val as? String{
                   if jsonConvertKeys.contains(key), let json = str.json{
                       if let jsonArray = json as? [Any]{
                           dict[key] = jsonArray.quoteClearArray
                       } else if let jsonDictionary = json as? [String:Any]{
                           dict[key] = jsonDictionary.quoteClearDictionary
                       } else {
                           dict[key] = json
                       }
                   } else {
                       dict[key] = str.quoteClearString
                   }
               } else if let subDict = val as? [String:Any]{
                   dict[key] = subDict.quoteClearDictionary
               } else if let arr = val as? [Any]{
                   dict[key] = arr.quoteClearArray
               } else {
                   dict[key] = val
               }
           }
           
           return dict
       }
   }
}

extension Array{
    var quoteClearArray : Array{
        get{
            var tempArray : [Element] = []
            for obj in self{
                if let dictObj = obj as? [String:Any]{
                    tempArray += [dictObj.quoteClearDictionary as! Element]
                } else if let str = obj as? String{
                    tempArray += [str.quoteClearString as! Element]
                } else {
                    tempArray += [obj]
                }
            }
            
            return tempArray
        }
    }
    
}



extension String {
    var quoteClearString : String{
          get{
              var str = self
              str = str.replacingOccurrences(of: "\"", with: "\\\"")
              str = str.replacingOccurrences(of: " 00:00:00", with: "")
              str = str.replacingOccurrences(of: "'", with: "׳")
              str = str.replacingOccurrences(of: "\\n", with: "")
              str = str.replacingOccurrences(of: "\n", with: "")
              str = str.replacingOccurrences(of: "\r", with: "")
              
              return str
          }
      }
}
