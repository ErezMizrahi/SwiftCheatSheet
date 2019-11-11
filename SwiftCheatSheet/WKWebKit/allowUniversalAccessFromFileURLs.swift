//
//  ViewController.swift
//  SwiftCheatSheet
//
//  Created by Erez Mizrahi on 06/11/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//

import WebKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // This enables access to file URLs relative to the content src. e.g. if the local page is foo/bar/index.html you can access files in foo/bar/ (e.g. foo/bar/1.jpg or foo/bar/sub/2.jpg) but not outside (e.g. foo/other/3.jpg or  Documents/NoCloud/4.jpg)
    func setupWebView() {
        let configs = WKWebViewConfiguration()
               configs.setValue(true, forKey: "_allowUniversalAccessFromFileURLs")
               let webKitView = WKWebView(frame: self.view.bounds, configuration: configs)
               self.view.addSubview(webKitView)
    }


}

