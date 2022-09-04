//
//  Weather.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 26.08.2022.
//

import Foundation

// MARK: - Weather
struct Weather: Codable {
    let lat, lon: Double
    let timezone: String
    let timezoneOffset: Double
    var current: Current
    let hourly: [Hourly]
    let daily: [Daily]

    enum CodingKeys: String, CodingKey {
        case lat, lon, timezone
        case timezoneOffset = "timezone_offset"
        case current, hourly, daily
    }
}
