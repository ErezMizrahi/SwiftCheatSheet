//
//  Graph protocol.swift
//  SwiftCheatSheet
//
//  Created by Erez Mizrahi on 21/11/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//

protocol Graph {
    associatedtype Element
    
    typealias Edge = GraphEdge<Element>
    typealias Vertex = Edge.Vertex
    
    var vertices: [Vertex] { get }
    
    @discardableResult mutating func addVertex(_: Element) -> Vertex
    func getEdge(from: Vertex)-> [Edge]
}
