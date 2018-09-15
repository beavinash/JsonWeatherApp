//
//  CurrentWeather.swift
//  JsonWeatherApp
//
//  Created by Avinash Reddy on 9/15/18.
//  Copyright © 2018 Avinash Reddy. All rights reserved.
//

import Foundation

class CurrentWeather {
    let temperature: Int?
    let humidity: Int?
    let precipProbability: Int?
    let summary: String?
    
    struct WeatherKeys {
        static let temperature = "temperature"
        static let humidity = "humidity"
        static let precipProbability = "precipProbability"
        static let summary = "summary"
    }
    
    init(weatherDictionary: [String: Any]) {
        self.temperature = weatherDictionary[WeatherKeys.temperature] as? Int
        if let humidityDouble = weatherDictionary[WeatherKeys.humidity] as? Double {
            self.humidity = Int(humidityDouble * 100)
        } else {
            self.humidity = nil
        }
        if let precipDouble = weatherDictionary[WeatherKeys.precipProbability] as? Double {
            precipProbability = Int(precipDouble * 100)
        } else {
            precipProbability = nil
        }
        summary = weatherDictionary[WeatherKeys.summary] as? String
    }
}
