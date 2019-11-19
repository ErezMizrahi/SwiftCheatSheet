//
//  HardwareKey.swift
//  SwiftCheatSheet
//
//  Created by Erez Mizrahi on 19/11/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//

import UIKit
extension UIDevice{
//    device id
    var hwKey : String{
        return self.identifierForVendor?.uuidString ?? ""
    }
}
