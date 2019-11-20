//
//  Json.swift
//  SwiftCheatSheet
//
//  Created by Erez Mizrahi on 19/11/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//

import Foundation

extension String{
    var json : Any?{
           get{
               guard let data = self.data(using: .utf8) else {return nil}
               return try? JSONSerialization.jsonObject(with: data, options: .init(rawValue: 0))
           }
       }
}


