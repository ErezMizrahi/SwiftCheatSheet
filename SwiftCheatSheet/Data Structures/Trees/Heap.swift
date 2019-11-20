//
//  Heap.swift
//  SwiftCheatSheet
//
//  Created by Erez Mizrahi on 20/11/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//

import Foundation

struct Heap<Element: Equatable> {
    fileprivate var elements: [Element] = []
    let areSorted: (Element,Element) -> Bool
    
    init(_ elements: [Element], _ areSorted: @escaping (Element,Element)->Bool) {
        self.elements = elements
        self.areSorted = areSorted
        
        guard !elements.isEmpty else { return }
        
        for index in stride(from: (elements.count - 1) / 2, through: 0, by: -1) {
            siftDown(from: index)
        }
    }
    
    var isEmpty: Bool {
        elements.isEmpty
    }
    
    var count: Int {
        elements.count
    }
    
    var peek: Element? {
        elements.first
    }
    
    
    func getChilIndices(ofParentAt parentIndex: Int) -> (left: Int, right:Int) {
        let leftIndex = (2 * parentIndex) + 1
        return (leftIndex, leftIndex + 1)
    }
    
    func getParentIndex(ofChildAt childIndex: Int) -> Int {
        return (childIndex - 1) / 2
    }
    
    func getFirstIndex(of element: Element, atStartIndex startingIndex: Int = 0) -> Int? {
        guard elements.indices.contains(startingIndex) else {
            return nil
        }
        
        if areSorted(element, elements[startingIndex]) {
            return nil
        }
        
        if element == elements[startingIndex] {
            return startingIndex
        }
        
        let childIndices = getChilIndices(ofParentAt: startingIndex)
        return getFirstIndex(of: element, atStartIndex: childIndices.left)
            ?? getFirstIndex(of: element, atStartIndex: childIndices.right)
    }
    
    mutating func insert(_ element: Element) {
        elements.append(element)
        siftUp(from: elements.count - 1)
    }
    
    mutating func remove(at index: Int) -> Element? {
        guard index < elements.count else {
            return nil
        }
        
        if index == (elements.count - 1) {
            return elements.removeLast()
        } else {
            elements.swapAt(index, elements.count - 1)
            
            defer {
                // can call them both because if one of them is not the right on it wont do anything
                siftUp(from: index)
                siftDown(from: index)
            }
            
            return elements.removeLast()
        }
    }
    
    mutating func siftDown(from index: Int, upTo count: Int? = nil) {
        var parentIndex = index
        let count = count ?? self.count
        
        while true {
            let (leftIndex, rightIndex) = getChilIndices(ofParentAt: parentIndex)
            
            var optionalParentSwapIndex: Int?
            if leftIndex < count && areSorted(elements[leftIndex], elements[parentIndex]) {
                optionalParentSwapIndex = leftIndex
            }
            if rightIndex < count && areSorted(elements[rightIndex], elements[optionalParentSwapIndex ?? parentIndex]) {
                optionalParentSwapIndex = rightIndex
            }
            
            guard let parentSwapIndex = optionalParentSwapIndex else { return }
            elements.swapAt(parentIndex, parentSwapIndex)
            parentIndex = parentSwapIndex
        }
    }
    
    mutating func siftUp(from index: Int) {
        var childIndex = index
        var parentIndex = getParentIndex(ofChildAt: childIndex)
        
        while childIndex > 0 && areSorted(elements[childIndex], elements[parentIndex]) {
            elements.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = getParentIndex(ofChildAt: childIndex)
        }
    }
    
    mutating func removeRoot() -> Element? {
        guard !isEmpty else { return nil }
        
        elements.swapAt(0, (elements.count - 1))
        let originalRoot = elements.removeLast()
        siftDown(from: 0)
        return originalRoot
    }
}



extension Array where Element: Equatable {
    init(_ heap: Heap<Element>) {
        var heap = heap
        
        for index in heap.elements.indices.reversed() {
            heap.elements.swapAt(0, index)
            heap.siftDown(from: 0, upTo: index)
        }
        self = heap.elements
    }
    
    func isHeap(sortedBy areSorted: @escaping (Element,Element)->Bool) -> Bool {
        if isEmpty {
            return true
        }
        
        for parentIndex in stride(from: (count / 2) - 1, to: 0, by: -1) {
            let parent = self[parentIndex]
            let leftChild = (2 * parentIndex) + 1
            
            if areSorted(self[leftChild], parent) {
                return false
            }
            
            let rightChild = leftChild + 1
            if rightChild < count && areSorted(self[rightChild], parent) {
                return false
            }
        }
        
        return true
    }
}
