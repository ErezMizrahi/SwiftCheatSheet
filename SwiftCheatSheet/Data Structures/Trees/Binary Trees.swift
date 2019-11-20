//
//  Binary Trees.swift
//  SwiftCheatSheet
//
//  Created by Erez Mizrahi on 20/11/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//

import Foundation


class BinaryNode<Element> {
  var value: Element
  var leftChild: BinaryNode?
  var rightChild: BinaryNode?
  
  init(value: Element) {
    self.value = value
  }
}

extension BinaryNode {
  func traverseInOrder(visit: (Element) -> Void) {
    leftChild?.traverseInOrder(visit: visit)
    visit(value)
    rightChild?.traverseInOrder(visit: visit)
  }
  
  func traversePreOrder(visit: (Element?) -> Void) {
    visit(value)
    if let leftChild = leftChild {
      leftChild.traversePreOrder(visit: visit)
    } else {
      visit(nil)
    }
    if let rightChild = rightChild {
      rightChild.traversePreOrder(visit: visit)
    } else {
      visit(nil)
    }
  }
  
  func traversePostOrder(visit: (Element) -> Void) {
    leftChild?.traversePostOrder(visit: visit)
    rightChild?.traversePostOrder(visit: visit)
    visit(value)
  }
}


extension BinaryNode {

    func serialize<T>(_ node: BinaryNode<T>) -> [T?] {
      var array: [T?] = []
      node.traversePreOrder { array.append($0) }
      return array
    }

//    func deserialize<T>(_ array: inout [T?]) -> BinaryNode<T>? {
//      guard let value = array.removeLast() else {
//        return nil
//      }
//
////      let node = BinaryNode(value: value)
//      node.leftChild = deserialize(&array)
//      node.rightChild = deserialize(&array)
//      return node
//    }

//    func deserialize<T>(_ array: [T?]) -> BinaryNode<T>? {
//      var reversed = Array(array.reversed())
//      return deserialize(&reversed)
//    }
}
