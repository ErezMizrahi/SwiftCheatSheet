//
//  Merge Sort.swift
//  SwiftCheatSheet
//
//  Created by Erez Mizrahi on 18/11/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//

import Foundation

func mergeSort<Element: Comparable>(_ array: [Element]) -> [Element] {
    guard array.count > 1 else {
        return array
    }
    
    let middle = (array.count / 2)
    let leftArray = mergeSort(Array(array[..<middle]))
    let rightArray = mergeSort(Array(array[middle...]))
    
    return merge(leftArray, rightArray)
}


func merge<Element: Comparable> (_ leftArr: [Element], _ rightArr: [Element]) -> [Element] {
    var rightIndex = 0
    var leftIndex = 0
    var result: [Element] = []
    
    while leftIndex < leftArr.count && rightIndex < rightArr.count {
        let leftElement = leftArr[leftIndex]
        let rightElement = rightArr[rightIndex]
        
        if leftElement < rightElement {
            result.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement {
            result.append(rightElement)
            rightIndex += 1
        } else {
            result.append(rightElement)
            result.append(leftElement)
            rightIndex += 1
            leftIndex += 1
        }
    }
    if leftIndex < leftArr.count {
        result.append(contentsOf: leftArr[leftIndex...])
    }
    if rightIndex < rightArr.count {
        result.append(contentsOf: rightArr[rightIndex...])
    }
    
    return result
}
