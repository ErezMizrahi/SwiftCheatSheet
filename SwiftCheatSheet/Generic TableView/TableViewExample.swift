//
//  TableViewExample.swift
//  SwiftCheatSheet
//
//  Created by Erez Mizrahi on 11/11/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//

import UIKit

// MARK:-  Example
struct Model {
    let name: String
}

class ModelCell: BaseCell<Model> {
    override var item: Model! {
        didSet {
            textLabel?.text = item.name
        }
    }
}

class SomeListController: GenericTableViewController<ModelCell, Model> {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get items because of ineritance
        items = [
            Model(name: "Name"),
            Model(name: "Name"),
            Model(name: "Name"),
            Model(name: "Name")
        ]
    }
}
