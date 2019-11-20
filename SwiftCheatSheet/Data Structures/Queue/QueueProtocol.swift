//
//  QueueProtocol.swift
//  SwiftCheatSheet
//
//  Created by Erez Mizrahi on 20/11/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//


protocol Queue: Sequence, IteratorProtocol {
    associatedtype Element

    mutating func enqueue(_ element: Element)
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}

extension Queue {
    mutating func next() -> Element? {
        return dequeue()
    }
}
