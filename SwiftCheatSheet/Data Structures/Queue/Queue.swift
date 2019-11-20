//
//  Queue.swift
//  SwiftCheatSheet
//
//  Created by Erez Mizrahi on 18/11/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//

import Foundation


//FIFO




struct QueueArray<T>: Queue {
    private var array: [T] = []
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var peek: T? {
        return array.first
    }
    
    mutating func enqueue(_ element: T) {
        self.array.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
}



struct QueueStack<T>: Queue {
    private var dequeueStack: [T] = []
    private var enqueueStack: [T] = []
    
    
    var isEmpty: Bool {
        return dequeueStack.isEmpty && enqueueStack.isEmpty
    }
    
    var peek: T? {
        return !dequeueStack.isEmpty ? dequeueStack.last : enqueueStack.first
    }
    
    mutating func enqueue(_ element: T) {
        self.enqueueStack.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> T? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        return dequeueStack.popLast()
    }
}
