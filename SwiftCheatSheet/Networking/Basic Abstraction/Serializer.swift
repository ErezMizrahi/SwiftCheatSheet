//
//  Serializer.swift
//  SwiftCheatSheet
//
//  Created by Erez Mizrahi on 09/03/2020.
//  Copyright © 2020 Erez Mizrahi. All rights reserved.
//


import Foundation
struct Serializer {
    func serialize(with request: Request) -> URLRequest? {
        let endpoint = request.endpoint
        let urlString = String([endpoint.baseURL,endpoint.path,request.pathExt].compactMap{$0}.joined(separator: "/").dropLast())
        
        guard var components = URLComponents(string: urlString) else { return nil }
        
        //check if get
        if endpoint.httpMethod == .GET {
            components.queryItems = request.params.compactMap{ URLQueryItem(name: $0.key, value: $0.value) }
        }
        
        
        guard let url = components.url else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.httpMethod.rawValue
    
        
        //handle if post
        if endpoint.httpMethod == .POST  && request.params.count > 0{
            let body = request.params.description
            urlRequest.httpBody = body.data(using: .utf8)
            urlRequest.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        }
        
        
        return urlRequest
    }
}
