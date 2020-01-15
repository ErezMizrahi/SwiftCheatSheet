//
//  Graph.swift
//  SwiftCheatSheet
//
//  Created by Erez Mizrahi on 21/11/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//

import Foundation

struct GraphVertex<Element> {
    let index: Int
    let element: Element
}

extension GraphVertex: Equatable where Element: Equatable { }

extension GraphVertex: Hashable where Element: Hashable { }


struct GraphEdge<Element> {
    typealias Vertex = GraphVertex<Element>
    
    let source: Vertex
    let destination: Vertex
    let weight: Double
}

extension GraphEdge: Equatable where Element: Equatable { }
