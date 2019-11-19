//
//  Insertion Sort.swift
//  SwiftCheatSheet
//
//  Created by Erez Mizrahi on 18/11/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//

import Foundation

func insertionSort<Element: Comparable>(_ array: inout [Element]) {
    guard array.count >= 2 else {
         return
    }
    
    for current in 1..<array.count {
        for shifting in (1...current).reversed() {
            if array[shifting] > array[shifting - 1] {
                array.swapAt(shifting, shifting - 1)
            } else {
                break
            }
        }
    }
}
