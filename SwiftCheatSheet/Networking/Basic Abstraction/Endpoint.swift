//
//  Endpoint.swift
//  SwiftCheatSheet
//
//  Created by Erez Mizrahi on 09/03/2020.
//  Copyright © 2020 Erez Mizrahi. All rights reserved.
//

import Foundation
struct Endpoint {
    static var BASE_URL_EXAMPLE = "https://your-api-base-url"
    
    var baseURL: String
    var path: String
    var httpMethod: HTTPMethod
    
    static var getAll: Endpoint {
        return Endpoint(baseURL: BASE_URL_EXAMPLE,
                        path: "the-basic-path-after-base-url",
                        httpMethod: .GET)
    }
}
