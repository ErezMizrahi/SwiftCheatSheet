//
//  Request.swift
//  SwiftCheatSheet
//
//  Created by Erez Mizrahi on 09/03/2020.
//  Copyright © 2020 Erez Mizrahi. All rights reserved.
//

import Foundation


struct Request {
    let endpoint: Endpoint
    let params: [String:String]
    let pathExt: String
    let serializer = Serializer()
    let executer = Executer()
    
    
    init(endpoint: Endpoint,
         params: [String:String] = [:],
         pathExt: String = "") {
        self.endpoint = endpoint
        self.params = params
        self.pathExt = pathExt
    }
    
    func sendRequest(_ completionHandler: @escaping (Result<[DECODED-TYPE],Error>)->()) {
        guard let request = serializer.serialize(with: self) else {
            //handle bad serialzer
            return
            
        }
        
        executer.execute(with: request) { (result) in
            switch (result) {
            case .failure(let error):
                //handle error
                print(error.localizedDescription)
                return
            case .success(let array):
                guard array.count > 0 else {
                    //handle empty array error
                    return
                    
                }
                completionHandler(.success(array))
                
            }
        }
    }
}
