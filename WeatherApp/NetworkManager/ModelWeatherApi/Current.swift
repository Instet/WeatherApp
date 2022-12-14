//
//  Current.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 26.08.2022.
//

import Foundation

// MARK: - Current

struct Current: Codable {
    let dt: Double
    let sunrise, sunset: Double
    var temp, feelsLike: Double

//    var tempString: String {
//        if UserDefaults.standard.value(forKey: SettingsKey.temperature.rawValue) as? String  == "C" {
//            return String(temp) + "\u{00B0}"
//        } else {
//            return String(Int(temp * 9 / 5 + 32)) + "F\u{00B0}"
//        }
//    }
    
    let pressure, humidity: Int
    let dewPoint, uvi: Double
    let clouds, visibility: Int
    let windSpeed: Double
    let windDeg: Int
    let weather: [WeatherElement]

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case uvi, clouds, visibility
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather
    }
}
