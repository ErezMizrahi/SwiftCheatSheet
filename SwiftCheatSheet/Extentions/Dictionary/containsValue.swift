//
//  containsValue.swift
//  SwiftCheatSheet
//
//  Created by Erez Mizrahi on 19/11/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//

import Foundation

extension Dictionary{
  func containsValue<T : Equatable>(value : T)->Bool{
    let contains = self.contains { (k, v) -> Bool in

        if let v = v as? T, v == value{
        return true
      }
      return false
    }
    return contains
  }
}
