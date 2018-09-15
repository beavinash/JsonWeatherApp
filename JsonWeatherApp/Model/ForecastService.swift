//
//  ForecastService.swift
//  JsonWeatherApp
//
//  Created by Avinash Reddy on 9/15/18.
//  Copyright © 2018 Avinash Reddy. All rights reserved.
//

import Foundation

class ForecastService {
    let forecastAPIKey: String
    let forecastBaseURL: URL?
    
    init(APIKey: String) {
        self.forecastAPIKey = APIKey
        forecastBaseURL = URL(string: "https://api.darksky.net/forecast/\(APIKey)")
    }
    
    func getForecast(latitude: Double, longitude: Double, completion: @escaping (CurrentWeather?) -> Void) {
        if let forecastURL = URL(string: "\(forecastBaseURL!)/\(latitude),\(longitude)") {
            let networkProcessor = NetworkProcessor(url: forecastURL)
            networkProcessor.downloadJSON { (jsonDictionary) in
                if let currentWeatherDictionary = jsonDictionary?["currently"] as? [String: Any] {
                    let currentWeather = CurrentWeather(weatherDictionary: currentWeatherDictionary)
                    completion(currentWeather)
                } else {
                    completion(nil)
                }
            }
        }
    }
}
