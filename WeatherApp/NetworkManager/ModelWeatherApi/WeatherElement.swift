//
//  WeatherElement.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 26.08.2022.
//

import Foundation

struct WeatherElement: Codable {
    let id: Int
    let weatherDescription: String

    enum CodingKeys: String, CodingKey {
        case id
        case weatherDescription = "description"
    }
}
