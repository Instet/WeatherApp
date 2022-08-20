//
//  Segments.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 19.08.2022.
//

import UIKit

enum Segments {

    case temperature
    case windSpeed
    case timeFormat
    case notification

    static func selectSegmets(_ segments: Segments) -> [String] {
        switch segments {
        case .temperature:
            return ["C", "F"]
        case .windSpeed:
            return ["Mi", "Km"]
        case .timeFormat:
            return ["12", "24"]
        case .notification:
            return ["On", "Off"]
        }
    }
}
