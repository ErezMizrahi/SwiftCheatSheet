//
//  HeatMeter.swift
//  SwiftCheatSheet
//
//  Created by Erez Mizrahi on 16/01/2020.
//  Copyright © 2020 Erez Mizrahi. All rights reserved.
//

import Foundation
import UIKit

class HeatMeter: UIView {
    let thermoLayer = CAShapeLayer()
    let lineWidth: CGFloat {
        return 
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    
    
    private func setupView() {
        layer.addSublayer(thermoLayer)
        
        //create a circle
        let height = bounds.height
        let width = bounds.width
        
        var path = UIBezierPath(ovalIn: CGRect(x: 0,
                                               y: height-width,
                                               width: width,
                                               height: width))
        
        thermoLayer.path = path.cgPath
        thermoLayer.strokeColor = UIColor.darkGray.cgColor
        thermoLayer.lineWidth = width / 3
    }
}
