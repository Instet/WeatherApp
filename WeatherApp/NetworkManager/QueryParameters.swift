//
//  QueryParameters.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 21.08.2022.
//

import Foundation

enum PathUrl: String, Equatable {

    case weather = "weather"
    case forecast = "forecast"
    
}

enum WeatherUnits: String, Equatable {
    
    case imperial = "imperial"
    case metric = "metric"
}
