//
//  HTML.swift
//  SwiftCheatSheet
//
//  Created by Erez Mizrahi on 19/11/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//

import Foundation
extension String {
    var htmlStripped : String{
        guard self.contains("<") else { return self }
        
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil).replacingOccurrences(of: "&nbsp;", with: "")
    }
}
