//
//  WeatherViewController.swift
//  JsonWeatherApp
//
//  Created by Avinash Reddy on 9/15/18.
//  Copyright © 2018 Avinash Reddy. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var temperatureScaleLabel: UILabel!
    

    
    let forecastAPIKey = "b755452304ad824d0ae5d33c150af721"
    let coordinate: (lat: Double, long: Double) = (37.8267, -122.4233)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let forecastService = ForecastService(APIKey: forecastAPIKey)
        forecastService.getForecast(latitude: coordinate.lat, longitude: coordinate.long) { (currentWeather) in
            if let currentWeather = currentWeather {
                print("Error: \(currentWeather)")
                DispatchQueue.main.async {
                    if let temperature = currentWeather.temperature {
                        self.temperatureLabel.text = "\(temperature)"
                    } else {
                        self.temperatureLabel.text = "-"
                    }
                }
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
