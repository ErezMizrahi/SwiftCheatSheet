//
//  CloseButton.swift
//  SwiftCheatSheet
//
//  Created by Erez Mizrahi on 16/01/2020.
//  Copyright © 2020 Erez Mizrahi. All rights reserved.
//

import UIKit

class CloseButton: UIButton {


    override func layoutSubviews() {
        super.layoutSubviews()
        setup()

    }
    private func setup() {
        self.backgroundColor = UIColor.red
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 1.0
        self.layer.shadowOpacity = 1
        
        
    }

}
