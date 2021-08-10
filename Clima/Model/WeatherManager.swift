//
//  WeatherManager.swift
//  Clima
//
//  Created by Firas El Jerdy on 10/08/2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    
    let weatherURL = " https://api.openweathermap.org/data/2.5/weather?"
    let apiParameters = "&appid=a111e3a30812649f19b2bcf0812e55e0&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)q=\(cityName)\(apiParameters)"
        print(urlString)
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        
       
        // 1. Create a URL
        
        if let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) {
            
            print("test")
            
            // 2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            // 3. Give the session a task
            let task = session.dataTask(with: url, completionHandler: handle(data: urlResponse: error:))
            
            // 4. Start the task
            task.resume()
        }
    }
    
    func handle(data: Data?, urlResponse: URLResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        }
    }
}
