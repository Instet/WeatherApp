//
//  NetworkService.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 21.08.2022.
//

import Foundation


class NetworkService {

    private let mainQueue = DispatchQueue.main

    private let apiKey = "8fdb51a42453a2b8d06b282efa0b2bf5"

    var units: WeatherUnits = .metric

    func requestCurrentWeather(longitude: Double, latitute: Double, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        let session = URLSession.shared
        let currentWeather = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitute)&lon=\(longitude)&appid=\(apiKey)&units=\(units.rawValue)&lang=ru")!
        let task = session.dataTask(with: currentWeather) { data, response, error in
            guard error == nil else {
                completion(.failure(.unknownError))
                return
            }
                let weatherData = String(data: data!, encoding: .utf8)
                print(weatherData?.description as Any)
        }
        task.resume()
    }


    func requestDailyWeather(longitude: Double, latitute: Double, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        let session = URLSession.shared
        let currentWeather = URL(string: "https://api.openweathermap.org/data/2.5/forecast?lat=\(latitute)&lon=\(longitude)&appid=\(apiKey)&units=\(units.rawValue)&lang=ru")!
        let task = session.dataTask(with: currentWeather) { data, response, error in
            guard error == nil else {
                completion(.failure(.unknownError))
                return
            }
                let weatherData = String(data: data!, encoding: .utf8)
                print(weatherData?.description as Any)
        }
        task.resume()
    }

}
