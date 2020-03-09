//
//  StoryBoard.swift
//  SwiftCheatSheet
//
//  Created by Erez Mizrahi on 16/01/2020.
//  Copyright © 2020 Erez Mizrahi. All rights reserved.
//

import UIKit

// to use this protocol, give in storyboard a Storyboard ID as the name of the class.

protocol Storyboarded {
     static func instantiate()-> Self
}

extension Storyboarded where Self: UIViewController {
static func instantiate() -> Self {
    let id = String(describing: self)
    let storyboard = UIStoryboard(name: "Main", bundle: .main)
    return storyboard.instantiateViewController(withIdentifier: id) as! Self
}
}
