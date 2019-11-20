//
//  Binary Search.swift
//  SwiftCheatSheet
//
//  Created by Erez Mizrahi on 20/11/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//

import Foundation
//MARK: - Binary SearcH
extension RandomAccessCollection where Element: Comparable {
    func binarySearch(for value: Element, in range: Range<Index>? = nil) -> Index? {
        let range = range ?? startIndex..<endIndex
        guard range.lowerBound < range.upperBound else {
            return nil
        }
        
        let size = distance(from: range.lowerBound, to: range.upperBound)
        let middle = index(range.lowerBound, offsetBy: size / 2)
        
        if self[middle] == value {
            return middle
        } else if self[middle] > value {
            return binarySearch(for: value, in: range.lowerBound..<middle)
        } else {
           return binarySearch(for: value, in: index(after: middle)..<range.upperBound)
        }
    }
}



//MARK:- Binary Search - find range of in array of value
//like [0,1,2,2,2,2,3,4] return 2...5




//MARK:- soultion not using Binary Search
func findIndices(of value: Int, in array: [Int]) -> CountableRange<Int>? {
    guard let startIndex = array.firstIndex(of: value)
  else {
    return nil
  }
    guard let endIndex = array.reversed().firstIndex(of: value)
  else {
    return nil
  }
  return startIndex..<endIndex.base
}



//MARK:- soultion using Binary Search
func findIndicesBinarySearch(of value: Int, in array: [Int]) -> CountableRange<Int>? {
    guard let startIndex = startIndex(of: value, in: array, range: 0..<array.count)
  else {
    return nil
  }
    guard let endIndex = endIndex(of: value, in: array, range: 0..<array.count)
  else {
    return nil
  }
  return startIndex..<endIndex
}



func startIndex(of value: Int, in array: [Int], range: CountableRange<Int>) -> Int? {
    let middleIndx = range.lowerBound + (range.upperBound - range.lowerBound / 2)
    
    if middleIndx == 0 || middleIndx == array.count - 1 {
        if array[middleIndx] == value {
            return middleIndx
        } else {
            return nil
        }
    }
    
    if array[middleIndx] == value {
        if array[middleIndx - 1] != value {
            return middleIndx
        } else {
            return startIndex(of: value, in: array, range: range.lowerBound..<middleIndx)
        }
    } else if value < array[middleIndx] {
            return startIndex(of: value, in: array, range: range.lowerBound..<middleIndx)
    } else {
        return startIndex(of: value, in: array, range: middleIndx..<range.upperBound)

    }
    
}

func endIndex(of value: Int, in array: [Int], range: CountableRange<Int>) -> Int? {
    let middleIndx = range.lowerBound + (range.upperBound - range.lowerBound / 2)
    
    if middleIndx == 0 || middleIndx == array.count - 1 {
        if array[middleIndx] == value {
            return middleIndx + 1
        } else {
            return nil
        }
    }
    
    if array[middleIndx] == value {
        if array[middleIndx + 1] != value {
            return middleIndx
        } else {
            return endIndex(of: value, in: array, range: middleIndx..<range.upperBound)
        }
    } else if value < array[middleIndx] {
            return endIndex(of: value, in: array, range: range.lowerBound..<middleIndx)
    } else {
        return endIndex(of: value, in: array, range: middleIndx..<range.upperBound)

    }
    
}
