//
//  KeyPath title Change.swift
//  SwiftCheatSheet
//
//  Created by Erez Mizrahi on 19/11/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//

import UIKit
import WebKit

class DummyController: UIViewController {
    
    // when webview is initailzed
     override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.title), options: .new, context: nil)
    }
    
    
    // deinit the observer to avoid memory leaks
    deinit {
        webView.removeObserver(self, forKeyPath: #keyPath(WKWebView.title))
    }
    
    
    func updateHeaderTitle(_ dynamicTitle: String){
          if !dynamicTitle.isEmpty {
              // change title
              return
          }
   
}
}

extension DummyController {
       override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
           if keyPath == "title" {
                   updateHeaderTitle("")
           }
       }
   }
