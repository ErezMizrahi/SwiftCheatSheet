//
//  DemoViewController.swift
//  SwiftCheatSheet
//
//  Created by Erez Mizrahi on 16/01/2020.
//  Copyright © 2020 Erez Mizrahi. All rights reserved.
//

import UIKit
//this is a demo class for the table view in the main.storyboard

class DemoViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let titlesArray = [
        "Heat Meter",
        "Circle Tracker",
        "Clock",
        "Heat Meter",
        "Circle Tracker",
        "Clock",
        "Heat Meter",
        "Circle Tracker",
        "Clock"
    ]
    
    enum Views: Int {
        case heatMeter
        case circleTracker
        case clock
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableview()
    }
    
    
    private func setupTableview() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    private func handleNavigation(with viewType: Views) {
        guard Thread.isMainThread else {
            handleNavigation(with: viewType)
            return
        }
        
        switch viewType {
        case .circleTracker:
            let controller = CircleTrackerViewController.instantiate()
            self.navigationController?.pushViewController(controller, animated: true)
        case .clock:
            let controller = ClockViewController.instantiate()
            self.navigationController?.pushViewController(controller, animated: true)
        case .heatMeter:
            let controller = HeatMeterViewController.instantiate()
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
    }
    
}


extension DemoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titlesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DemoCell.reuseID, for: indexPath) as! DemoCell
        let title = titlesArray[indexPath.row]
        cell.configure(with: title)
        print(#function)

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewType = Views.init(rawValue: indexPath.row) else { return }
        self.handleNavigation(with: viewType)
    }
    
}




class DemoCell: UITableViewCell, SelfConfiguration {
    static var reuseID: String = "cell"
    @IBOutlet weak var demoLabel: UILabel!
    @IBOutlet weak var myBackground: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //do setup here when the view is loaded from nib file or interface builder
        //called once when the view is loaded
        //this function will be called after all the view and subviews are loaded
        print(#function)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //do setup here when the view appers and reappers
        //this function will be called when all the views and subviews are loaded and constraints
        // will be called every time a cell is dequed
        print(#function)

        // corner radius
        self.myBackground.layer.cornerRadius = 20
        self.myBackground.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMinYCorner]
        //border
        self.myBackground.layer.borderWidth = 1
        self.myBackground.layer.borderColor = UIColor.white.cgColor
        
        //shadow
        self.myBackground.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.myBackground.layer.shadowColor = UIColor.black.cgColor
        self.myBackground.layer.shadowOpacity = 0.3
        self.myBackground.layer.shadowRadius = 3
    }
    
    
    func configure(with data: String) {
        self.demoLabel.text = data
    }
}
