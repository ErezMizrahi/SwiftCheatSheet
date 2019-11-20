//
//  Priority Queue.swift
//  SwiftCheatSheet
//
//  Created by Erez Mizrahi on 20/11/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//

import Foundation

struct PriorityQueue<Element: Equatable>: Queue{
    private var heap: Heap<Element>

    init(_ elements: [Element], _ areSorted: @escaping (Element,Element)->Bool) {
        self.heap = Heap(elements, areSorted)
    }
    
    mutating func enqueue(_ element: Element) {
        heap.insert(element)
    }
    
    mutating func dequeue() -> Element? {
        heap.removeRoot()
    }
    
    var isEmpty: Bool {
        heap.isEmpty
    }
    
    var peek: Element? {
        heap.peek
    }
    
    
    
    
    
}
