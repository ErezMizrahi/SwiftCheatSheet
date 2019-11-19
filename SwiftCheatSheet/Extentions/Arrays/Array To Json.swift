//
//  Json.swift
//  SwiftCheatSheet
//
//  Created by Erez Mizrahi on 19/11/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//

import Foundation
extension Array where Element == String{
    var jsonString : String{
        get{
            
            guard let jsonData = try? JSONSerialization.data(withJSONObject: self, options: .init(rawValue: 0)) else{
                return ""
            }
            
            guard let jsonString = String(data: jsonData, encoding: .utf8) else{
                return ""
            }
            
            return jsonString
        }
    }
    
 
    
}
