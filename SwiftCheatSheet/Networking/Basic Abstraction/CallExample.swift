//
//  CallExample.swift
//  SwiftCheatSheet
//
//  Created by Erez Mizrahi on 09/03/2020.
//  Copyright © 2020 Erez Mizrahi. All rights reserved.
//

import Foundation

let request = Request(endpoint: .getAll,params: ["queryKeyName" : "queryValue"])
request.sendRequest { (result) in
    print(result)
}
