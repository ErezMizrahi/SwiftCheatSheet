//
//  SelfConfigureCell.swift
//  SwiftCheatSheet
//
//  Created by Erez Mizrahi on 16/01/2020.
//  Copyright © 2020 Erez Mizrahi. All rights reserved.
//

import Foundation
protocol SelfConfiguration: class {
    static var reuseID: String {get set}
    func configure(with data: String)
}
