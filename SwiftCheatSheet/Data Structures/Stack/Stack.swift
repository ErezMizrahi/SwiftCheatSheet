//
//  GenericTableViewController.swift
//  SwiftCheatSheet
//
//  Created by Erez Mizrahi on 11/11/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//




//LIFO
struct Stack<Element: Equatable>: Equatable {
    //Storage
    private var storage: [Element] = []
    
    init() { }
    init(elements: [Element]) {
        self.storage = elements
    }
    
    //Push
    mutating func push(_ element: Element){
        self.storage.append(element)
    }
    
    //Pop
    @discardableResult
    mutating func pop() -> Element? {
        return self.storage.popLast()
    }
    
    // allows us to quickly see the top of the stack without changing the stack
    func peek() -> Element? {
        return self.storage.last
    }
    
    var isEmpty: Bool {
        return peek() == nil
    }
}



extension Stack: CustomStringConvertible {
    var description: String {
        return storage
                    .map{ "\($0)"}
                    .joined(separator: " ")
    }
}


extension Stack: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        self.storage = elements
    }
}
