//
//  JSHelperMethods.swift
//  SwiftCheatSheet
//
//  Created by Erez Mizrahi on 10/11/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//

import WebKit

let webView = WKWebView()

    

// method declaration
func callJavaScript(funcName : String, args : String){
    let jsString = "\(funcName)(\"\(args)\")"
    webView.evaluateJavaScript(jsString, completionHandler: nil)
}

//implementation
//            callJavaScript(funcName:"methodName", args: "args..")


    
    
    
// method declaration
func call(jsString : String){
    webView.evaluateJavaScript(jsString, completionHandler: nil)
}

//implementation
//               callJavaScript(funcName:"methodName", args: "args..")
