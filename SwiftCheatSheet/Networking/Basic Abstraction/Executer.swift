//
//  Executer.swift
//  SwiftCheatSheet
//
//  Created by Erez Mizrahi on 09/03/2020.
//  Copyright © 2020 Erez Mizrahi. All rights reserved.
//
import Foundation

struct Executer {
    func execute(with urlRequest: URLRequest,
                 _ decoder: JSONDecoder = JSONDecoder(),
                 _ completionHandler: @escaping (Result<[DECODED-TYPE],Error>)->()) {
        
        URLSession.shared.dataTask(with: urlRequest) { (data, res, err) in
            if let data = data {
                //headers if needed
                let _ = (res as? HTTPURLResponse)?.allHeaderFields as? [String:String]
                if let code = res as? HTTPURLResponse {
                    if code.statusCode >= 200 && code.statusCode < 299{
                        do {
                        let decodedData = try decoder.decode(DECODED-TYPE.self, from: data)
                            completionHandler(.success(decodedData))
                        } catch {
                            //handle decoding error
                            print(error)
                        }
                    }
                }
            }
            
            if let _ = err {
                //handle error
                print(err?.localizedDescription.description ?? "")
            }
        }.resume()
    }
}
