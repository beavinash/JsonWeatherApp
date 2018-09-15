//
//  NetworkProcessor.swift
//  JsonWeatherApp
//
//  Created by Avinash Reddy on 9/15/18.
//  Copyright © 2018 Avinash Reddy. All rights reserved.
//

import Foundation

class NetworkProcessor {
    let url: URL
    
    lazy var configuration: URLSessionConfiguration = URLSessionConfiguration.default
    lazy var session: URLSession = URLSession(configuration: configuration)
    
    init(url: URL) {
        self.url = url
    }
    
    typealias JSONDictionaryHolder = (([String: Any]?) -> Void)
    
    func downloadJSON(_ completion: @escaping JSONDictionaryHolder) {
        let request = URLRequest(url: self.url)
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if error == nil {
                if let httpResponse = response as? HTTPURLResponse {
                    switch httpResponse.statusCode {
                    case 200: // successful
                        if let data = data {
                            do {
                                let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                                completion(jsonDictionary as? [String: Any])
                            } catch let error as NSError {
                                print(error.localizedDescription)
                            }
                            
                        }
                    default:
                        print("HTTP response code: \(httpResponse.statusCode)")
                    }
                }
            } else {
                print("Error: \(error!.localizedDescription)")
            }
        }
        dataTask.resume()
    }
}
