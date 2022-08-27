//
//  Hourly.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 26.08.2022.
//

import Foundation

struct Hourly: Codable {
    
    let dt: Int
    let temp, feelsLike: Double
    let pressure, humidity: Int
    let dewPoint, uvi: Double
    let clouds, visibility: Int
    let windSpeed: Double
    let windDeg: Int
    let pop: Double
    let weather: [WeatherElement]

    enum CodingKeys: String, CodingKey {
        case dt, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case uvi, clouds, visibility
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather, pop
    }
}
